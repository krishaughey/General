Select-String -Path "C:\Users\khaughey\OneDrive - Freedom Mortgage Corporation\Documents\WORKING\Certificates\Connection_Errors.txt" -Pattern '\[(.*?)\]' | % { $_.Matches } | % { $_.Value }


Select-String -Path "C:\Users\khaughey\OneDrive - Freedom Mortgage Corporation\Documents\WORKING\Certificates\Connection_Errors.txt" -Pattern 'PSComputerName' -SimpleMatch | select line

