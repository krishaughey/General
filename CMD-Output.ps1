$data=nbtstat /n | Select-String "<"

$lines=$data | foreach { $_.Line.Trim()}

$lines | foreach { $temp=$_ -split "\s+"
New-Object -TypeName PSObject -Property @{
	Name=$temp[0]
	NbtCode=$temp[1]
	Type=$temp[2]
	Status=$temp[3]}
}
