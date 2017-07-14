#Add-PSSnapin "Microsoft.SharePoint.PowerShell"


#####variables

$searchServiceAppPoolName = "Dedicated SP2016 Search App Pool"  ## Name of the App Pool that was created before
$searchServiceAppPool =  Get-SPServiceApplicationPool -Identity $searchServiceAppPoolName

$searchServiceName = "Dedicated SP2016 Search Service"
$searchServiceProxyName = "(Proxy)Dedicated SP2016 Search Service"
$databaseName = "Dedicated_SP2016_Search_DB"

#####


#Create Search Service Application
# here is when Search DBs are created. i.e, Search DB,CrawlStore & LinksStore
$searchServiceApp = New-SPEnterpriseSearchServiceApplication -Name $searchServiceName -ApplicationPool $searchServiceAppPool -DatabaseName $databaseName


#Create Search Service Application Proxy
#New-SPEnterpriseSearchServiceApplicationProxy -Name $searchServiceProxyName -SearchApplication $searchServiceApp