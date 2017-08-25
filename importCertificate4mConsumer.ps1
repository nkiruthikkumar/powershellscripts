

$trustRootCert = Get-PfxCertificate 'C:\kk\ConsumingFarmRoot.cer'
New-SPTrustedRootAuthority 'SP2013-Root-ConsumingFarm' -Certificate $trustRootCert


$trustSTSCert = Get-PfxCertificate 'C:\kk\ConsumingFarmSTS.cer'
New-SPTrustedServiceTokenIssuer 'SP2013-STS-ConsumingFarm' -Certificate $trustSTSCert
