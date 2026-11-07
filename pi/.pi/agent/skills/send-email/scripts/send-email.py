#!/usr/bin/env python3
"""Create MIME drafts or explicitly send via iCloud SMTP with STARTTLS."""
import argparse
from email import policy
from email.headerregistry import Address
from email.message import EmailMessage
from email.utils import formatdate, make_msgid
import os
from pathlib import Path
import smtplib
import ssl
import sys


def address(value):
    if not value or any(c in value for c in '\r\n,; '):
        raise argparse.ArgumentTypeError('Use one bare email address without whitespace.')
    try:
        parsed = Address(addr_spec=value)
        if not parsed.username or not parsed.domain:
            raise ValueError()
    except ValueError:
        raise argparse.ArgumentTypeError('Invalid email address.') from None
    return value


def build_message(sender, recipient, subject, text, html=None):
    address(sender)
    address(recipient)
    if not subject.strip() or '\r' in subject or '\n' in subject:
        raise ValueError('Subject must be nonempty and contain no newlines.')
    message = EmailMessage(policy=policy.SMTP)
    message['From'] = sender
    message['To'] = recipient
    message['Subject'] = subject
    message['Date'] = formatdate(localtime=True)
    message['Message-ID'] = make_msgid()
    message.set_content(text)
    if html is not None:
        message.add_alternative(html, subtype='html')
    return message


def save_message(message, path):
    fd = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    with os.fdopen(fd, 'wb') as output:
        output.write(message.as_bytes())


def submit(message, username, password):
    # Do not log SMTP protocol traffic: authentication data is sensitive.
    with smtplib.SMTP('smtp.mail.me.com', 587, timeout=30) as smtp:
        smtp.ehlo()
        smtp.starttls(context=ssl.create_default_context())
        smtp.ehlo()
        smtp.login(username, password)
        refused = smtp.send_message(message)
        if refused:
            raise RuntimeError('Recipient refused.')
        # Once DATA was accepted, a later QUIT failure must not imply send failure.
        print('SUBMITTED: iCloud SMTP accepted the message; delivery is not confirmed.', flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('mode', choices=('draft', 'send'))
    parser.add_argument('--from', dest='sender', type=address,
                        default=os.environ.get('ICLOUD_SMTP_USERNAME'))
    parser.add_argument('--to', type=address, required=True)
    parser.add_argument('--subject', required=True)
    parser.add_argument('--text', type=Path, required=True)
    parser.add_argument('--html', type=Path)
    parser.add_argument('--output', type=Path,
                        help='New private .eml file; required for drafts, optional audit copy for sends')
    args = parser.parse_args()
    if not args.sender:
        parser.error('Set ICLOUD_SMTP_USERNAME or supply --from.')
    username = os.environ.get('ICLOUD_SMTP_USERNAME')
    password = os.environ.get('ICLOUD_SMTP_APP_PASSWORD')
    if args.mode == 'send':
        if not username or not password:
            parser.error('Set ICLOUD_SMTP_USERNAME and ICLOUD_SMTP_APP_PASSWORD in the environment.')
        if args.sender != username:
            parser.error('Sender must match ICLOUD_SMTP_USERNAME; aliases are not supported.')
    if args.mode == 'draft' and not args.output:
        parser.error('Draft mode requires --output (a new .eml path).')
    try:
        message = build_message(args.sender, args.to, args.subject,
                                args.text.read_text(encoding='utf-8'),
                                args.html.read_text(encoding='utf-8') if args.html else None)
        if args.output:
            save_message(message, args.output)
        if args.mode == 'draft':
            print(f'DRAFT FILE: {args.output.resolve()}; not sent or saved to a mailbox.')
            return 0
        submit(message, username, password)
        return 0
    except (OSError, ValueError, smtplib.SMTPException, RuntimeError):
        # Never echo exception details: they can include server replies or credentials.
        print('ERROR: Email operation failed. For send mode, submission may be uncertain; '
              'do not automatically retry. Check the recipient and any preceding SUBMITTED output.', file=sys.stderr)
        return 1


if __name__ == '__main__':
    sys.exit(main())
