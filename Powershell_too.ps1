#Artur-Mihk Peterson
#13.12.2022
#csv failist emailidest nimed


#skripti asukoht
$spath = $MyInvocation.Mycommand.Path
$d = Split-path $spath

#Küsin kasutajalt faili 
$fail = Read-Host -prompt ("Sisesta csv faili nimi")
if ($fail -like '*.csv*') {$kasutajad = Import-Csv $d\$fail}
else {Write-Host "Pole .csv"}
foreach ($kasutaja in $kasutajad)
{
$email = $kasutaja.emails
$enimi = $email.split(".")[0]
$ppnimi = $email.split("@")[0]
$pnimi = $ppnimi.split(".")[1]

$oenimi = $enimi.substring(0,1).ToUpper()+$enimi.substring(1).tolower()
$opnimi = $pnimi.substring(0,1).ToUpper()+$pnimi.substring(1).tolower()

$oenimi+" "+$opnimi >> $d\nimed.txt
}