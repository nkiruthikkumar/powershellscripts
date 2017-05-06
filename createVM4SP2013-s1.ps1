$VM = New-VM  -Name 'SP2013-S1'  -MemoryStartUpBytes  6GB   -Path  'C:\ProgramData\Microsoft\Windows\Hyper-V'  -SwitchName  "IEE" -VHDPath  "O:\VHDX\2013_withDB\sp2013_withDB.vhdx"   -ErrorAction  'Stop' -Verbose  $True

Set-VMProcessor sp2013-s1  -Count 4  -Reserve 10 -Maximum 75 -RelativeWeight 200

