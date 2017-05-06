

$VM = New-VM  -Name 'Win2012R2-DOCO-AD'  -MemoryStartUpBytes  3GB   -Path  'C:\ProgramData\Microsoft\Windows\Hyper-V'   -VHDPath  "D:\VM_Ds\HyperV_Disks\Win2012R2-DOCO-128GB\Win2012R2-AD-4mSSD.VHDX"   -ErrorAction  'Stop' -Verbose  $True


# set processor thread
Set-VMProcessor $VM.name   -Count 2  -Reserve 10 -Maximum 75 -RelativeWeight 200


# set static MAC address for the router to set the Static IP
Add-VMNetworkAdapter  $vm   -StaticMacAddress 'D0:C0:82:01:D0:C0' -SwitchName 'IEE' 


