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

This will display any like this:
```bash
BUSID   VID:PID     DEVICE                      STATE
3-1     03da:ab41   USB Printing Support        Not attached
```

First you will want bind the device with: 

```bash
usbipd bind --hardware-id <VID:PID>`.
```

Now start the script using the pattern that you choose:

```powershell
autoStartUSBIP.ps1 <VID:PID|DEVICE>
```

> Note: This script uses `BurntToast` but it is not necessary!

#### TIP

If your windows are blocking you to run this scripts, you can do this:

```powershell
Unblock-File -Path <script-path>
```

## start-usbip-at-startup.bat

This is just a script to run autoStartUSBIP.ps1 hidden at the startup of Windows.
Edit and put this at user startup folder. (`Windows + R`, `shell:startup`)

