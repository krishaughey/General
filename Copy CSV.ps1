$SourceFile = Read-Host 'enter the path to the source file ( e.g. - <c:\Temp\March_2021.csv> )'
Import-CSV $SourceFile -Header "mail" | Where-Object { ![string]::IsNullOrWhiteSpace($_.PSObject.Properties.Value) }
Add-Content -Path $SourceFile -Value "department,displayName,targetAddress,mailNickName,msExchHideFromAddressLists,name"

$Parents = @(
    foreach ($mail in $CSV) {
        'department' = "CARDParents"
        'displayName' = $mail
        'targetAddress' = "SMTP:"$mail
        'mailNickName' = $mail
        'msExchHideFromAddressLists' = "TRUE"
        'name' = $mail
    } 
)
$Parents | foreach {Add-Content -Path $SourceFile -Value $PSItem}



# name,displayName,mail,targetAddress,mailNickName,msExchHideFromAddressLists,Department
# 1212dozerdog@gmail.com,1212dozerdog@gmail.com,1212dozerdog@gmail.com,SMTP:1212dozerdog@gmail.com,1212dozerdog7000,TRUE,CARDParents
