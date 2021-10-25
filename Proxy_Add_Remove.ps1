#Grabs CSV file
$filePath = Read-Host "Enter CSV filepath"
$ADUsers = Import-csv $filePath
Write-Host "Importing $filePath"
Start-Sleep -Seconds 2
Import-Module activedirectory

$counter = 0
Start-Sleep -Seconds 2

#creates var for each column 
foreach ($user in $ADUsers) {

$Username = $User.username
$proxyAddresses = "smtp:$Username@domain.com"


Set-ADUser -Identity $Username -Remove @{ProxyAddresses= $proxyAddresses} 

}


	