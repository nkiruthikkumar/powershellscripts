$VM = New-VM  -Name 'SP2013-S1'  -MemoryStartUpBytes  6GB   -Path  'C:\ProgramData\Microsoft\Windows\Hyper-V'   -VHDPath  "O:\VHDX\2013_withDB\sp2013_withDB.vhdx"   -ErrorAction  'Stop' -Verbose  $True



# set static MAC address for the router to set the Static IP
Add-VMNetworkAdapter  $vm   -StaticMacAddress 'D0:C0:82:01:20:13' -SwitchName 'IEE' 


Set-VMProcessor  $VM.name  -Count 4  -Reserve 25 -Maximum 75 -RelativeWeight 200



