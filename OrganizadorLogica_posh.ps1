param(
    [string]$origen,
    [string]$destino
)

Write-Host "Iniciando la organización de archivos..." -ForegroundColor Green
Write-Host "Origen: $origen" -ForegroundColor Yellow
Write-Host "Destino: $destino" -ForegroundColor Yellow

Get-ChildItem -Path $origen -File -Recurse | ForEach-Object {
    
    $extension = $_.Extension -replace "\." , ""
    
    if ([string]::IsNullOrWhiteSpace($extension)) {
        $extension = "SIN_EXTENSION"
    }

    $carpeta_extension = Join-Path -Path $destino -ChildPath $extension
    
    if (-not (Test-Path -Path $carpeta_extension)) {
        New-Item -ItemType Directory -Path $carpeta_extension | Out-Null
    }
    
    Move-Item -Path $_.FullName -Destination $carpeta_extension -Force
}

Write-Host "¡Organización de archivos completada! Presiona una tecla para salir." -ForegroundColor Green
Read-Host