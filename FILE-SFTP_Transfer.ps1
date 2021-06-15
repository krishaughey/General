# STFP Transfer to Remote Computer
## REQUIRES Module "Posh-SSH" https://www.powershellgallery.com/packages/Posh-SSH
#### author: Kristopher F. Haughey
Import-Module Posh-SSH

$ComputerName = "s-b2da76e6f91c4b8f9.server.transfer.us-west-2.amazonaws.com"
$UserName = "incarddwwdprd"
$KeyFile = "D:\SFTP\Key........."
$Credential = New-Object System.Management.Automation.PSCredential ($UserName)
$LocalFile = "D:\SFTP\GroupIDExport.csv"
$SFTPPath = 'In/'
$SFTPSession = New-SFTPSession -ComputerName $ComputerName -Credential $Credential -KeyFile $KeyFile

Set-SFTPFile -SessionId $SFTPSession.SessionID -RemotePath $SFTPPath -LocalFile $LocalFile -Overwrite
Remove-SFTPSession -SessionId $SFTPSession.SessionID
