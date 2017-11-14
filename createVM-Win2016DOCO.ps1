

$VM = New-VM  -Name 'Win2016_DOCO_AD-Gen2' -Generation 2 -MemoryStartUpBytes  3GB   -Path  'C:\ProgramData\Microsoft\Windows\Hyper-V'   -VHDPath  "O:\VHDX\Win2016\Win2016Base-for-AD\AD-Win2016Base.vhdx"   -ErrorAction  'Stop' -Verbose 


# set processor thread
Set-VMProcessor $VM.name   -Count 2  -Reserve 10 -Maximum 75 -RelativeWeight 200


# set static MAC address for the router to set the Static IP
Add-VMNetworkAdapter  $vm1   -StaticMacAddress 'D0:C0:20:16:D0:C0' -SwitchName 'iee' 


