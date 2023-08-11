clear
$list = Get-Content ".\list.txt"
$randomValue = Get-Random $list
if ($randomValue -ge 7) {
    Write-Host "CONGRATS! You're getting -- $randomValue --" -ForegroundColor Cyan
}
pause
