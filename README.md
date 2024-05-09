# WSL Utils

## waitUntilWSL.ps1

Waits for any WSL distribution starts, if anyone distributions are running, this scripts will verify until any distributions starts.

### Requirements

- WSL

```powershell
waitUntilWSL.ps1

Write-Output "Any WSL initiated"
```


## autoStartUSBIP.ps1

Start automaticaly a USBIP attach to a device with a certain pattern description.

### Requirements

- waitUntilWSL.ps1**
- WSL
- [USBIPD-WIN-4.2.0](https://github.com/dorssel/usbipd-win/releases)

### How to use

Check the pattern that you want to use:
 
```powershell
usbipd list
```

Starts the script using the pattern of your choose:

```powershell
autoStartUSBIP.ps1 "your pattern"
```

> Note: This script uses `BurntToast` but it is not necessary!

## start-usbip-at-startup.bat

This is just a script to run autoStartUSBIP.ps1 hidden at the startup of Windows.
Edit and put this at user startup folder. (`Windows + R`, `shell:startup`)

