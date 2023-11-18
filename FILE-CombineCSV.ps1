# Set the path to the folder containing CSV files
$folderPath = "C:\Path\To\Your\Folder"

# Set the output path for the combined CSV file
$outputPath = "C:\Path\To\Your\CombinedFile.csv"

# Get all CSV files in the folder
$csvFiles = Get-ChildItem -Path $folderPath -Filter *.csv

# Initialize an empty array to store CSV data
$combinedData = @()

# Loop through each CSV file and append its data to the array
foreach ($file in $csvFiles) {
    $csvData = Import-Csv $file.FullName
    $combinedData += $csvData
}

# Export the combined data to a new CSV file
$combinedData | Export-Csv -Path $outputPath -NoTypeInformation