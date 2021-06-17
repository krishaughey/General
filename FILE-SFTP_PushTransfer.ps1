# STFP Transfer to Remote Computer
## REQUIRES Module "Posh-SSH" https://www.powershellgallery.com/packages/Posh-SSH
#### author: Kristopher F. Haughey
Import-Module Posh-SSH

$ComputerName = "<HOSTNAME>"
$UserName = "<USERNAME>"
$KeyFile = "D:\SFTP\Key\OpenSSH.key"
$NoPassword = new-object System.Security.SecureString
$Credential = New-Object System.Management.Automation.PSCredential ($UserName, $NoPassword)
$LocalFile = "D:\SFTP\<FILENAME>"
$RemotePath = '/'
$SFTPSession = New-SFTPSession -ComputerName $ComputerName -Credential $Credential -KeyFile $KeyFile

Set-SFTPFile -SessionId $SFTPSession.SessionID -RemotePath $RemotePath -LocalFile $LocalFile -Overwrite
Remove-SFTPSession -SessionId $SFTPSession.SessionID
