clear
$list = Get-Content "$env:USERPROFILE\Documents\SCRIPTS\list.txt"
$randomValue = Get-Random $list
if ($randomValue -ge 7) {
    Write-Host "CONGRATS! You're getting -- $randomValue --" -ForegroundColor Cyan
}
pause