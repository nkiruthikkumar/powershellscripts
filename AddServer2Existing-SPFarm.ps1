
 $dbSrchServer = "VMSrch01"
 $dbName = "SPConfigDB_DedicatedSearchFarm"
 $passPhrase =  Read-Host 'Enter the SP Farm Passphrase :'  -AsSecureString

Connect-SPConfigurationDatabase -DatabaseServer  $dbSrchServer  -DatabaseName  $dbName  -Passphrase  $passPhrase -LocalServerRole Search  
