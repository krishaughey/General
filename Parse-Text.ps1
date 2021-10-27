Select-String -Path "C:\Users\khaughey\OneDrive - Freedom Mortgage Corporation\Documents\WORKING\Local Group Membership\LocalGroupMembership_UAT_ERRORS.txt" -Pattern '\[(.*?)\]' | % { $_.Matches } | % { $_.Value }


Select-String -Path "C:\Users\khaughey\OneDrive - Freedom Mortgage Corporation\Documents\WORKING\Local Group Membership\LocalGroupMembership_DEV_ERRORS.txt" -Pattern 'PSComputerName' -SimpleMatch | select line

