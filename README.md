# General
Repository for general PS scripts. Text manipulation, etc.

![PowerShell](https://repository-images.githubusercontent.com/221074232/158c2480-5262-11ea-8af0-452a86d9e56d)

###### Convert JSON to CSV
    ((Get-Content -Path $pathToJsonFile) | ConvertFrom-Json).results | Export-CSV $pathToOutputFile -NoTypeInformation
    