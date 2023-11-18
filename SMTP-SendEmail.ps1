# Define email parameters
$smtpServer = "your_smtp_server"
$smtpFrom = "your_email@example.com"
$smtpTo = "recipient@example.com"
$messageSubject = "Subject of the email"
$messageBody = "Body of the email"
$smtpUsername = "your_username"
$smtpPassword = "your_password"

# Create email object
$mailmessage = New-Object system.net.mail.mailmessage 
$mailmessage.from = ($smtpFrom)
$mailmessage.To.add($smtpTo)
$mailmessage.Subject = $messageSubject
$mailmessage.Body = $messageBody

# Set up SMTP client
$smtp = New-Object Net.Mail.SmtpClient($smtpServer)
$smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUsername, $smtpPassword)

# Send the email
$smtp.Send($mailmessage)

Write-Host "Email sent successfully."