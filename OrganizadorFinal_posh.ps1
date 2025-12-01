
function Get-Path {
    param(
        [string]$PromptMessage
    )
    
    $Path = ""
    do {
        $Path = Read-Host -Prompt $PromptMessage
        $Path = $Path -replace '"',''
        
        if ($PromptMessage -like "*ORIGEN*") {
            if (-not (Test-Path -Path $Path -PathType Container)) {
                Write-Host "ERROR: La ruta '$Path' no es una carpeta válida o no existe. Intenta de nuevo." -ForegroundColor Red
                $Path = "" # Vuelve a iterar el bucle
            }
        }
    } while ([string]::IsNullOrWhiteSpace($Path))
    
    return $Path
}

cls
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "  ORGANIZADOR DE ARCHIVOS POR EXTENSIÓN" -ForegroundColor Yellow
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

$origen = Get-Path -Prompt ">>> Introduce la RUTA de la Carpeta ORIGEN"
Write-Host ""

$destino = Get-Path -Prompt ">>> Introduce la RUTA de la Carpeta DESTINO (se creará si no existe)"
Write-Host ""

Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "  CONFIRMACIÓN" -ForegroundColor Yellow
Write-Host "  Origen: $origen" -ForegroundColor Green
Write-Host "  Destino: $destino" -ForegroundColor Green
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

# Preguntar si conservar archivos en la ubicación original
$conservar = Read-Host "¿Deseas CONSERVAR los archivos en la ubicación original? (S/N)"
$conservar = $conservar.ToUpper()

if ($conservar -ne "S" -and $conservar -ne "N") {
    Write-Host "ERROR: Respuesta no válida. Por favor, ingresa 'S' o 'N'." -ForegroundColor Red
    exit
}

$copiar = ($conservar -eq "S")

if ($copiar) {
    Write-Host "Se COPIARÁN los archivos (se conservarán en el origen)" -ForegroundColor Cyan
} else {
    Write-Host "Se MOVERÁN los archivos (se eliminarán del origen)" -ForegroundColor Cyan
}

Read-Host "Presiona Enter para comenzar la organización..." | Out-Null


Write-Host "Iniciando la organización de archivos (buscando en subcarpetas)..." -ForegroundColor Magenta

Get-ChildItem -Path $origen -File -Recurse | ForEach-Object {
    
    $extension = $_.Extension -replace "\." , ""
    
    if ([string]::IsNullOrWhiteSpace($extension)) {
        $extension = "SIN_EXTENSION"
    }

    $carpeta_extension = Join-Path -Path $destino -ChildPath $extension
    
    if (-not (Test-Path -Path $carpeta_extension)) {
        New-Item -ItemType Directory -Path $carpeta_extension | Out-Null
    }
    
    if ($copiar) {
        Copy-Item -Path $_.FullName -Destination $carpeta_extension -Force
    } else {
        Move-Item -Path $_.FullName -Destination $carpeta_extension -Force
    }
}


Write-Host ""
Write-Host "¡Organización de archivos completada!" -ForegroundColor Green
Read-Host "Presiona Enter para salir." | Out-Null