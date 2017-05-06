Import-Module Hyper-V

$ethernet = Get-NetAdapter -Name ethernet

New-VMSwitch -Name iee    -NetAdapterName $ethernet.Name -AllowManagementOS $true -Notes ‘Intel Ethernet (External)’