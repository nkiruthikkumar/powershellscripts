

$VM = New-VM  -Name 'Win2016-AD'  -MemoryStartUpBytes  3GB   -Path  'C:\ProgramData\Microsoft\Windows\Hyper-V'   -VHDPath  "C:\Users\Public\Documents\Hyper-V\Virtual hard disks\Win2016-AD.vhdx"   -ErrorAction  'Stop' -Verbose  $True


# set processor thread
Set-VMProcessor $VM.name   -Count 2  -Reserve 10 -Maximum 75 -RelativeWeight 200


# set static MAC address for the router to set the Static IP
Add-VMNetworkAdapter  $vm   -StaticMacAddress 'D0:C0:82:01:DD:CC' -SwitchName 'IEE' 


