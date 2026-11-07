"""Offline tests only: no SMTP connections or real credentials."""
import argparse
import importlib.util
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import MagicMock, patch

spec = importlib.util.spec_from_file_location('send_email', Path(__file__).with_name('send-email.py'))
mail = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mail)


class EmailTests(unittest.TestCase):
    def message(self):
        return mail.build_message('sender@icloud.com', 'to@example.com', 'Test', 'Plain',
                                  '<a href="https://example.com">View listing</a>')

    def test_mime(self):
        msg = self.message()
        self.assertEqual(msg.get_content_type(), 'multipart/alternative')
        self.assertIn('href=', msg.get_body(preferencelist=('html',)).get_content())
        self.assertIn('Plain', msg.get_body(preferencelist=('plain',)).get_content())

    def test_headers(self):
        for value in ('a@example.com\nBcc:x@y.com', 'a@x.com,b@y.com', 'missing-domain'):
            with self.assertRaises(argparse.ArgumentTypeError):
                mail.address(value)
        with self.assertRaises(ValueError):
            mail.build_message('a@x.com', 'b@y.com', 'test\r\nBcc: x@y.com', 'body')

    def test_private_exclusive_draft(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'draft.eml'
            mail.save_message(self.message(), path)
            self.assertEqual(path.stat().st_mode & 0o777, 0o600)
            with self.assertRaises(FileExistsError):
                mail.save_message(self.message(), path)

    def test_tls_before_credentials(self):
        with patch.object(mail.smtplib, 'SMTP') as smtp_class, patch('builtins.print'):
            smtp = smtp_class.return_value.__enter__.return_value
            smtp.send_message.return_value = {}
            mail.submit(self.message(), 'sender@icloud.com', 'fake-password')
            smtp_class.assert_called_once_with('smtp.mail.me.com', 587, timeout=30)
            names = [call[0] for call in smtp.method_calls]
            self.assertEqual(names, ['ehlo', 'starttls', 'ehlo', 'login', 'send_message'])

    def test_draft_does_not_connect(self):
        with tempfile.TemporaryDirectory() as directory:
            text = Path(directory) / 'body.txt'
            text.write_text('Test')
            args = ['send-email.py', 'draft', '--from', 'a@icloud.com', '--to', 'b@example.com',
                    '--subject', 'Test', '--text', str(text), '--output', str(Path(directory)/'draft.eml')]
            with patch.object(mail.sys, 'argv', args), patch.object(mail.smtplib, 'SMTP') as smtp, patch('builtins.print'):
                self.assertEqual(mail.main(), 0)
                smtp.assert_not_called()


if __name__ == '__main__':
    unittest.main()
