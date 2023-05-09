##  !DRAFT! NOT TESTED  ##

$pathToJsonFile = "D:\CSV to Json Sample\SampleDataCarInfo.json"
$pathToOutputFile = "D:\CSV to Json Sample\SampleDataCarInfoOutput.csv"
((Get-Content -Path $pathToJsonFile) | ConvertFrom-Json) | ForEach-Object {
$Make = $_.Name
$MakeDescription = $_.Desc
$Models = $_.Models | ForEach-Object {
    $Model = $_.Name
    $ModelDescription = $_.Desc
    $ModelBodyType = $_.BodyType
    $ModelRating = $_.Rating
    $Variants += $_.Variants | ForEach-Object {
       [pscustomobject] @{
            'Make' = $Make
            'MakeDescription' = $MakeDescription
            'Model' = $Model
            'ModelDescription' = $ModelDescription
            'ModelBodyType' = $ModelBodyType
            'ModelRating' = $ModelRating
            'Variant' = $_.Name
            'VariantDescription' = $_.Desc
            'Price' = $_.Price
            'Transmission' = $_.Transmission
            'Fuel' = $_.Fuel
        }
    }
}
} 
$Variants | Export-CSV $pathToOutputFile -NoTypeInformation