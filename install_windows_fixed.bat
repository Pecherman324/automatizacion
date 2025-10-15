@echo off
REM Script de instalacion para Windows (PowerShell)
REM Este script instala Chocolatey y Puppet

echo 🚀 Iniciando instalacion de Puppet en Windows...

REM Verificar si Chocolatey esta instalado
choco --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 📦 Instalando Chocolatey...
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
) else (
    echo ✅ Chocolatey ya esta instalado
)

REM Instalar Puppet
echo 🎭 Instalando Puppet...
choco install puppet -y

REM Refrescar variables de entorno
echo 🔄 Refrescando variables de entorno...
call refreshenv

REM Verificar instalacion
echo ✅ Verificando instalacion de Puppet...
puppet --version

echo.
echo 🎉 ¡Instalacion completada!
echo.
echo 📋 Proximos pasos:
echo 1. Ejecuta: puppet apply apache_simple.pp
echo 2. O usa el modulo: puppet apply site.pp
echo 3. Verifica con: curl http://localhost/index.html
echo.
echo ⚠️  IMPORTANTE: Si "puppet" no se reconoce, ejecuta:
echo    refreshenv
echo    O reinicia PowerShell como administrador
echo.

pause
