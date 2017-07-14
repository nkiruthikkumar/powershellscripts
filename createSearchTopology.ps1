#Add-PSSnapin "Microsoft.SharePoint.PowerShell"

$servername = $env:computername 

##Get the Search SA
$searchServiceApp = Get-SPEnterpriseSearchServiceApplication  -Identity "Dedicated SP2016 Search Service"
$searchTopology = New-SPEnterpriseSearchTopology -SearchApplication $searchServiceApp 

New-SPEnterpriseSearchAdminComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  
New-SPEnterpriseSearchCrawlComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  
New-SPEnterpriseSearchContentProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  
New-SPEnterpriseSearchAnalyticsProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  
New-SPEnterpriseSearchQueryProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  

## Mentioning the IndexPartition 
New-SPEnterpriseSearchIndexComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  -IndexPartition 0


Set-SPEnterpriseSearchTopology -Identity  $searchTopology 