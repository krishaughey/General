## Update Atlassian Account Nickname from a List
##### Import Name and UserId from CSV, prompt for API Key, and update account
##### author: Kristopher Haughey

$useraccountList = Import-Csv "~/temp/UserAccountList.csv"
$token = Read-Host -input "Enter your API token key"

foreach ($useraccount in $useraccountList){
  $userId = $useraccount."userid"
  $userNickName = $useraccount."name"

  $headers = @{
    Authorization = 'Bearer {0}' -f $token
    Accept        = 'application/json'
    "Content-Type"  = 'application/json'
  }

  $uri = "https://api.atlassian.com/users/$userId/manage/profile"
  $json = @{
    nickname = "$userNickName"
  } | ConvertTo-JSON

Invoke-WebRequest -Uri $uri -Body $json -Headers $headers -Method Patch
}
