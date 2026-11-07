-- Usage: osascript send-email.applescript draft|send FROM TO SUBJECT BODY_FILE
-- Message data is passed as arguments, never interpolated into AppleScript source.
on run argv
	if (count of argv) is not 5 then error "Usage: osascript send-email.applescript draft|send FROM TO SUBJECT BODY_FILE"
	set actionName to item 1 of argv
	if actionName is not "draft" and actionName is not "send" then error "Mode must be draft or send."
	set fromAddress to item 2 of argv
	set toAddress to item 3 of argv
	set subjectText to item 4 of argv
	if fromAddress is "" or toAddress is "" or subjectText is "" then error "Sender, recipient, and subject are required."
	if fromAddress contains return or fromAddress contains linefeed or toAddress contains return or toAddress contains linefeed or subjectText contains return or subjectText contains linefeed then error "Headers must not contain newlines."
	if toAddress does not contain "@" or toAddress contains "," or toAddress contains ";" then error "Provide one recipient email address."
	set bodyText to read (POSIX file (item 5 of argv)) as «class utf8»
	tell application "Mail"
		set senderFound to false
		repeat with mailAccount in every account
			if (email addresses of mailAccount) contains fromAddress then set senderFound to true
		end repeat
		if not senderFound then error "Sender is not a configured Apple Mail account address."
		set outgoing to make new outgoing message with properties {visible:false, sender:fromAddress, subject:subjectText, content:bodyText}
		tell outgoing
			make new to recipient at end of to recipients with properties {address:toAddress}
		end tell
		if actionName is "send" then
			set submitted to send outgoing
			if submitted is not true then error "Mail did not confirm submission. Inspect Mail before retrying; do not send automatically again."
			return "SUBMITTED: Apple Mail accepted the send request; delivery is not confirmed."
		else
			save outgoing
			set visible of outgoing to true
			return "DRAFT: Saved and opened in Apple Mail; not sent."
		end if
	end tell
end run
