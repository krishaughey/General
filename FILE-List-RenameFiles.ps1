$photoDir = "/Users/kristopherhaughey/temp/ProfilePhotos/Photos/" #target folder
$CSV = "/Users/kristopherhaughey/temp/ProfilePhotos/Mapping01.csv" #path to CSV

cd ($photoDir); Import-Csv ($CSV)| foreach {
    Rename-Item -path $_.name01 -newname $_.positionID}

<# EXAMPLE CSV
name01,positionID
/Users/kristopherhaughey/temp/ProfilePhotos/Photos/aperson@DOMAIN.com.jpg,CTS011517.jpg
#>
