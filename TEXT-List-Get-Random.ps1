clear
$list = Get-Content ".\list.txt"
$randomValue = Get-Random $list
{
    Write-Host "CONGRATS! You're getting -- $randomValue --" -ForegroundColor Cyan
}
pause
