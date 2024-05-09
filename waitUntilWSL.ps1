$wslRunning = 0
while ($wslRunning -eq 0) {
    
    $wslList = $(wsl.exe --list --running -q)

    # Remover caracteres nulos da saída
    $wslList = $wslList -replace "\0", ""

    # Verificar se a lista contém a string desejada usando expressão regular
    if ($wslList -match "[a-z]") {
        Write-Output "WSL running"
        $wslRunning = 1
    }
    else {
        Write-Output "no WSL running..."
        Start-Sleep -Seconds 1
    }    
}