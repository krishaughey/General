## Update Atlassian Account Nickname
##### Prompt for Admin API Token Key, UserId, and Nickname 
##### author: Kristopher Haughey

$token = Read-Host -input "Enter your admin API token key"
$userId = Read-Host -input "Enter the UserId for the account you wish to edit"
$nickname = Read-Host -input "Enter the Nickname for the account you wish to edit"

$headers = @{
    Authorization = 'Bearer {0}' -f $token
    Accept        = 'application/json'
    "Content-Type"  = 'application/json'
  }

$uri = "https://api.atlassian.com/users/$userId/manage/profile"
$json = @{
    nickname = "$nickname"
} | ConvertTo-JSON

Invoke-WebRequest -Uri $uri -Body $json -Headers $headers -Method Patch
