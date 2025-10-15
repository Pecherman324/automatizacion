@echo off
REM Script de instalaciÃ³n para Windows (PowerShell)
REM Este script instala Chocolatey y Puppet

echo ðŸš€ Iniciando instalaciÃ³n de Puppet en Windows...

REM Verificar si Chocolatey estÃ¡ instalado
choco --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ðŸ“¦ Instalando Chocolatey...
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
) else (
    echo âœ… Chocolatey ya estÃ¡ instalado
)

REM Instalar Puppet
echo ðŸ“¥ Instalando Puppet...
choco install puppet -y

REM Verificar instalaciÃ³n
echo âœ… Verificando instalaciÃ³n de Puppet...
puppet --version

echo.
echo ðŸŽ‰ Â¡InstalaciÃ³n completada!
echo.
echo ðŸ“‹ PrÃ³ximos pasos:
echo 1. Ejecuta: puppet apply apache.pp
echo 2. O usa el mÃ³dulo: puppet apply site.pp
echo 3. Verifica con: curl http://localhost
echo.

pause
