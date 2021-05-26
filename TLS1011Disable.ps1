#**************************************************#
#                                                  #
# Script Name: TLS 1.0 & 1.1 Disabler              #
# Version: 1.0                                     #
# Author: Nic Coursey                              #  
# Date: 05/24/2021                                 #
#                                                  #
# Description:                                     #
#         This script will remove TLS 1.0 and      #
#         wait for user confirmation to            #
#         continue and remove TLS 1.1 or quit.     #
#**************************************************#

$ErrorActionPreference = Stop

Clear-Host

Set-ExecutionPolicy RemoteSigned

#******************************#
#     Disable TLS 1.0          #
#******************************#

Try {

Write-Host "This script is designed to disable TLS 1.0 and TLS 1.1. You have the option to stop the script after TLS 1.0 is disabled."
Read-Host "Please press Enter to begin disabling TLS 1.0"



Write-Host "Disabling TLS 1.0..."
Write-Host "......................."

New-item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -Force | Out-Null

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -Name 'Enabled' -Value '0' -PropertyType 'DWord' -Force | Out-Null

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server' -name 'DisabledByDefault' -Value 1 -PropertyType 'DWord' -Force | Out-Null

New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -Force | Out-Null

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -Name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null

New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -name 'DisabledByDefault' -Value 1 -PropertyType 'DWord' -Force | Out-Null

write-host "TLS 1.0 Disabled successfully. To verify, reboot your machine, review script source code and compare registry entries." -ForegroundColor Red -BackgroundColor White
}

Catch {
    write-host "Something went wrong. Please contact Nic C. for assistance"
    }


$hostinput = Read-Host "To continue the script and disable TLS 1.1, type 'Yes'. Otherwise, enter 'No' to quit"

Try {

if ($hostinput -eq 'Yes') {

    write-host "You have answered 'yes', continuing script and disabling TLS 1.1"

    write-host "......."

#**********************#
#    Disable TLS 1.1   #
#**********************#

    Write-Host "Disabling TLS 1.1..."
    Write-Host "..........."

    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' -Force | Out-Null
    
    New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
    
    New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
    
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -Force | Out-Null
    
    New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
    
    New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null

    Write-Host 'TLS 1.1 has been disabled.'

    Write-Host "Press the Any Key to exit the script. Thank you for choosing Apeture Sciences. Your compliance is appreciated."
    
    }

    elseif ($HostInput -eq 'no' ) {
        write-host "You have entered 'no'. The Script Exiting. Please reboot and verify that TLS 1.0 was successfully disabled via the Registry Editor"
        
        
    }

    else {
        write-host "You have entered an invalid option, and I'm not good with Do/While loops. Restart the script, because it just quit."
        }

    }

    Catch {
        Write-Host "Something went wrong. Retry the script, and contact Nic if it still doesn't work."
    }







 
