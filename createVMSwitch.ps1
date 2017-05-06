Import-Module Hyper-V


New-VMSwitch -Name iee    -NetAdapterName $ethernet.Name -AllowManagementOS $true -Notes ‘Intel Ethernet (External)’