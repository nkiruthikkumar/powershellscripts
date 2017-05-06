 

$vhdxPath = 'D:\VM_Ds\HyperV_Disks\SP2016\SP2016-single-server-doco\win2012R2Std_Growing.vhdx'

$VM = New-VM  -Name 'SP2016-S1'  -MemoryStartUpBytes  8GB   -Path  'C:\ProgramData\Microsoft\Windows\Hyper-V'   -VHDPath   $vhdxPath    -ErrorAction  'Stop' -Verbose  $True

# set static MAC address for the router to set the Static IP
Add-VMNetworkAdapter  $vm   -StaticMacAddress 'D0:C0:82:01:20:16' -SwitchName 'IEE' 

Set-VMProcessor  $VM.name  -Count 4  -Reserve 25 -Maximum 75 -RelativeWeight 200

