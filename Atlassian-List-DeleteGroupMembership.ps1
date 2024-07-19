## Remove Group Membership of Atlassian Account Users from a List
##### Import UserId and GroupId from CSV, prompt for API Key, and update accounts
##### author: Kristopher Haughey

$userAccountList = Import-Csv "~/temp/UserList.csv"
$domain = Read-Host -input "Enter your Atlassian URL (e.g. 'https://your-domain.atlassian.net')"
$username = Read-Host -input "Enter your Atlassian Admin account"
$upassword = Read-Host -input "Enter your API KEY"
$auth = $username + ':' + $upassword
$Encoded = [System.Text.Encoding]::UTF8.GetBytes($auth)
$authorizationInfo = [System.Convert]::ToBase64String($Encoded)
$headers = @{"Authorization"="Basic $($authorizationInfo)"}

foreach ($userAccount in $userAccountList){
  $userId = $userAccount."UserId"
  $groupId = $userAccount."GroupId"
  $uri = "$domain/rest/api/3/group/user?groupId=$groupId&accountId=$userId"
  Invoke-RestMethod -Uri $uri -Method DELETE -Headers $headers
}
