@echo off
title Organizador de Archivos por Extensión

:MENU
cls
echo ===========================================
echo   ORGANIZADOR DE ARCHIVOS SIMPLE (PowerShell)
echo ===========================================
echo.

set /p "Origen=>>> Introduce la RUTA de la Carpeta ORIGEN: "
if not exist "%Origen%" (
    echo.
    echo ERROR: La ruta de origen no existe. Intenta de nuevo.
    pause > nul
    goto MENU
)

echo.
set /p "Destino=>>> Introduce la RUTA de la Carpeta DESTINO: "

echo.
echo ===========================================
echo Confirmación:
echo   Origen: %Origen%
echo   Destino: %Destino%
echo ===========================================
echo.
pause

REM Ejecuta el script de PowerShell, pasándole las rutas como argumentos
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0OrganizadorLogica.ps1" -origen "%Origen%" -destino "%Destino%"

echo.
echo El proceso de PowerShell ha finalizado.
pause
exit