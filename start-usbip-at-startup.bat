@REM Get the folder that the script are located
set "scriptDir=%~dp0"

@REM Init autostartUSBIP
powershell -WindowStyle Hidden -File %scriptDir%autoStartUSBIP.ps1 "Printing|Impressão"