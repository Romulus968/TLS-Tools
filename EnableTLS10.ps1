#8888888888888888888888#
#                      #
#   Enable TLS 1.0     #
#                      #
# Author: Nic Coursey  #
# Version: 1.0         #
# Date: 05/24/2021     #
#                      #
#  Description:        #
#   This script        #
#   enables TLS 1.0    #
#   if needed          #
#8888888888888888888888#


Set-ExecutionPolicy RemoteSigned


Write-Host "This script is designed to enable TLS 1.0 in the event it is needed."
Write-Host "Please note that TLS 1.0 is depreciated, and it's use is not recommended."
$userAccept = Read-Host "Please type 'Yes' to indicate you understand the purpose of this script: "

if ($userAccept -eq 'Yes'){


Read-Host "Please press Enter to begin enabling TLS 1.0"



Write-Host "Enabling TLS 1.0..."
Write-Host "......................."

New-item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -Force | Out-Null

New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -Name 'Enabled' -Value '1' -PropertyType 'DWord' -Force | Out-Null

New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -name 'DisabledByDefault' -Value 0 -PropertyType 'DWord' -Force | Out-Null

New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -Force | Out-Null

New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -Name 'Enabled' -value '1' -PropertyType 'DWord' -Force | Out-Null

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -name 'DisabledByDefault' -Value 0 -PropertyType 'DWord' -Force | Out-Null

write-host "TLS 1.0 enabled successfully. To verify, reboot your machine, review script source code and compare registry entries." -ForegroundColor Red -BackgroundColor White

}
else {
    Write-Host "You have entered an invalid option. Script exiting."
    }
