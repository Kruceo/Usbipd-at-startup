& $PSScriptRoot\waitUntilWSL.ps1

Start-Sleep 5

# Install bash at docker-desktop distribution if necessary
# Bash are necessary for usbipd-win
wsl.exe -d docker-desktop -- apk add bash

if ($null -ne $args ) {
    $targetPattern = $args[0]
}

if ($null -eq $targetPattern ) {
    $targetPattern = "Printing"
}

$usbipList = $(usbipd list)

$matchedLine = $usbipList | Select-String -Pattern $targetPattern

while ($matchedLine.Matches.Count -lt 1) {
    Write-Output "Trying a match again"
    $usbipList = $(usbipd list)
    $matchedLine = $usbipList | Select-String -Pattern $targetPattern
    Start-Sleep -Seconds 3
}

$matchedRegion = $matchedLine.Line | Select-String -Pattern " [0-9,a-z]+?:[0-9,a-z]+? " 

$vidpid = $matchedRegion.Matches.Groups[0].Value.Replace(" ", "")

# Import the BurntToast module
Import-Module BurntToast

# Create a simple toast notification
New-BurntToastNotification -Text "USBIP will run with device $vidpid"


while (1) {
    
    & $PSScriptRoot\waitUntilWSL.ps1

    usbipd.exe bind --hardware-id $vidpid

    Start-Sleep -Seconds 5

    usbipd.exe attach --wsl --hardware-id $vidpid -a

    Write-Output "restarting in 5 seconds"
    Start-Sleep -Seconds 5
    New-BurntToastNotification -Text "Fail... Restarting"

}

