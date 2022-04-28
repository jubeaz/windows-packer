# Set variables to indicate value and key to set
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce'
$Name         = 'reinitVM'
$Value        = 'C:\Windows\System32\Sysprep\sysprep.exe /oobe /reboot /generalize /unattend:C:\sysprep.xml'
# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType ExpandString -Force 
