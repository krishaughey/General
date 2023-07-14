$Photos = "/Users/kristopherhaughey/temp/ProfilePhotos/Photos/" #target folder
$CSV = "/Users/kristopherhaughey/temp/ProfilePhotos/MappingFile.csv" #path to CSV

cd ($Photos); Import-Csv ($CSV)| foreach {Rename-Item -path $_.path -newname $_.filename}
