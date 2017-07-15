

#Add-PSSnapin "Microsoft.SharePoint.PowerShell"

Add-SPShellAdmin

$rootCert = (Get-SPCertificateAuthority).RootCertificate
$stsCert = (Get-SPSecurityTokenServiceConfig).LocalLoginProvider.SigningCertificate


##create folder like KK as below 
$rootCert.Export("Cert") | Set-Content C:\kk\ConsumingFarmRoot.cer -Encoding byte
$stsCert.Export("Cert") | Set-Content C:\kk\ConsumingFarmSTS.cer -Encoding byte

