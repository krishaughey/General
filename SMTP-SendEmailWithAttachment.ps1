# Define email parameters
$smtpServer = "your_smtp_server"
$smtpFrom = "your_email@example.com"
$smtpTo = "recipient@example.com"
$messageSubject = "Subject of the email"
$messageBody = "Body of the email"
$smtpUsername = "your_username"
$smtpPassword = "your_password"
$attachmentPath = "C:\Path\To\Your\File.txt" # Replace with the actual path to your file

# Create email object
$mailmessage = @{
    From         = $smtpFrom
    To           = $smtpTo
    Subject      = $messageSubject
    Body         = $messageBody
    Attachments  = $attachmentPath
}

# Set up SMTP client
$smtp = @{
    SmtpServer   = $smtpServer
    Credentials  = New-Object System.Net.NetworkCredential($smtpUsername, $smtpPassword)
}

# Send the email
Send-MailMessage @mailmessage @smtp

Write-Host "Email with attachment sent successfully."