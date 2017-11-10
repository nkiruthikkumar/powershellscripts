#Add-PSSnapin "Microsoft.SharePoint.PowerShell"

$servername = $env:computername 

##Get the Search SA
$searchServiceApp = Get-SPEnterpriseSearchServiceApplication  -Identity "Dedicated SP2016 Search Service"
$searchTopology = New-SPEnterpriseSearchTopology -SearchApplication $searchServiceApp 

#New-SPEnterpriseSearchAdminComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  
#New-SPEnterpriseSearchCrawlComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  
#New-SPEnterpriseSearchContentProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  
#New-SPEnterpriseSearchAnalyticsProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  
#New-SPEnterpriseSearchQueryProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  

## Mentioning the IndexPartition 
#New-SPEnterpriseSearchIndexComponent -SearchTopology $searchTopology  -SearchServiceInstance $servername  -IndexPartition 0


#Set-SPEnterpriseSearchTopology -Identity  $searchTopology 


 ## add components for Host1(VMSrch01)
New-SPEnterpriseSearchAdminComponent -SearchTopology $searchTopology  -SearchServiceInstance $host1  
New-SPEnterpriseSearchCrawlComponent -SearchTopology $searchTopology  -SearchServiceInstance $host1  
New-SPEnterpriseSearchIndexComponent -SearchTopology $searchTopology  -SearchServiceInstance $host1   -IndexPartition 0

 ## add components for Host2(VMSrch02)
New-SPEnterpriseSearchQueryProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $host2
New-SPEnterpriseSearchAnalyticsProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $host2   
New-SPEnterpriseSearchContentProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $host2


 ## add components for Host3(VMSrch03)
 New-SPEnterpriseSearchQueryProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $host3
 New-SPEnterpriseSearchContentProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $host3
 New-SPEnterpriseSearchAnalyticsProcessingComponent -SearchTopology $searchTopology  -SearchServiceInstance $host3   


 ## add components for Host4(VMSrch04)
 New-SPEnterpriseSearchIndexComponent -SearchTopology $searchTopology  -SearchServiceInstance $host4   -IndexPartition 0
 New-SPEnterpriseSearchAdminComponent -SearchTopology $searchTopology  -SearchServiceInstance $host4  
 New-SPEnterpriseSearchCrawlComponent -SearchTopology $searchTopology  -SearchServiceInstance $host4  

#make this new search topology ACTIVE
 Set-SPEnterpriseSearchTopology -Identity  $searchTopology 


 ## check the topology / status
 Get-SPEnterpriseSearchTopology -SearchApplication $searchServiceApp
 Get-SPEnterpriseSearchStatus -SearchApplication $searchServiceApp -Text