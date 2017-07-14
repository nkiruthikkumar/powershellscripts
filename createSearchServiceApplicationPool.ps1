#Add-PSSnapin "Microsoft.SharePoint.PowerShell"
#####variables
$searchServiceAppPoolName = "Dedicated SP2016 Search App Pool"
$searchServiceAppPoolAccount = "doco\spsearch"

#assuming that you are configuring only in the current server 
#(current servername ie., WINSP2016SRCH )
$servername = $env:computername 
#####


## Register the service account as Managed account
$appPoolCredential = Get-Credential  $searchServiceAppPoolAccount
New-SPManagedAccount  -Credential $appPoolCredential

##CREATE Search Service APP Pool
$searchServiceAppPool = New-SPServiceApplicationPool -Name $searchServiceAppPoolName -Account $searchServiceAppPoolAccount -Verbose



###By default below Services will be running if the SharePoint 2016 server is 
#  configured for Search Role(MinRole)
#				"Search Administration Web Service", 
#				"Search Query and Site Settings Service",
#				"Search Host Controller Service",
#				"SharePoint Server Search"

## if not at least start these two service instance
#Start-SPEnterpriseSearchServiceInstance $servername 
#Start-SPEnterpriseSearchQueryAndSiteSettingsServiceInstance $servername 

 
 