#!/usr/bin/env python3
"""Build a private HTML MIME email preview. Never sends or imports a draft."""
import argparse
from email import policy
from email.message import EmailMessage
from email.utils import formatdate, make_msgid, parseaddr
import os
from pathlib import Path
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--from', dest='sender', required=True)
    parser.add_argument('--to', required=True)
    parser.add_argument('--subject', required=True)
    parser.add_argument('--html', type=Path, required=True)
    parser.add_argument('--text', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--open', action='store_true')
    args = parser.parse_args()
    for value in (args.sender, args.to, args.subject):
        if not value.strip() or '\r' in value or '\n' in value:
            parser.error('Headers must be nonempty and contain no newlines.')
    for value in (args.sender, args.to):
        if parseaddr(value)[1] != value or value.count('@') != 1 or any(c in value for c in ',; '):
            parser.error('Provide one bare email address per header.')
    message = EmailMessage(policy=policy.SMTP)
    message['From'] = args.sender
    message['To'] = args.to
    message['Subject'] = args.subject
    message['Date'] = formatdate(localtime=True)
    message['Message-ID'] = make_msgid()
    message.set_content(args.text.read_text(encoding='utf-8'))
    message.add_alternative(args.html.read_text(encoding='utf-8'), subtype='html')
    # Exclusive creation prevents overwriting a previous preview or following a symlink.
    fd = os.open(args.output, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    with os.fdopen(fd, 'wb') as output:
        output.write(message.as_bytes())
    print(f'PREVIEW: {args.output.resolve()}; not sent or saved as a native Mail draft.')
    if args.open:
        subprocess.run(['open', '-a', 'Mail', str(args.output.resolve())], check=True)


if __name__ == '__main__':
    main()
