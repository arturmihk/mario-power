#Artur-Mihk Peterson
#13.12.2022
#csv failist emailide nimed kätte saada ja faili panna


#skripti asukoht
$spath = $MyInvocation.Mycommand.Path
$d = Split-path $spath

#Küsin kasutajalt faili 
$loop = 1
While ($loop -eq 1) 
{
    $fail = (Read-Host -prompt ("Sisesta csv faili nimi"))
    if ([IO.Path]::GetExtension($fail) -eq '.csv') {
    $loop = 0
    
$kasutajad = Import-Csv $d\$fail    
#loop
foreach ($kasutaja in $kasutajad)
{
#nimede splittimine
$email = $kasutaja.emails
$enimi = $email.split(".")[0]
$ppnimi = $email.split("@")[0]
$pnimi = $ppnimi.split(".")[1]
#suure tähe tegemine
$oenimi = $enimi.substring(0,1).ToUpper()+$enimi.substring(1).tolower()
$opnimi = $pnimi.substring(0,1).ToUpper()+$pnimi.substring(1).tolower()
#faili copimine
$oenimi+" "+$opnimi >> $d\nimed.txt
}





    }
     
    
    else {"Ei ole csv fail"}

}