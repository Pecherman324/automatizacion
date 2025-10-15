# 🪟 Configuración de Puppet en Windows

## 📋 Requisitos Previos

- ✅ Windows 10/11
- ✅ XAMPP instalado y funcionando
- ✅ Permisos de administrador
- ✅ Conexión a internet

## 🚀 Instalación Paso a Paso

### Paso 1: Ejecutar PowerShell como Administrador

1. Presiona **Windows + X**
2. Selecciona **"Windows PowerShell (Administrador)"**
3. Confirma con **"Sí"** en el control de cuentas de usuario

### Paso 2: Navegar al Proyecto

```powershell
cd C:\xampp\htdocs\puppet
```

### Paso 3: Instalar Puppet

```powershell
# Opción A: Usar el script corregido
.\install_windows_fixed.bat

# Opción B: Instalación manual
choco install puppet -y
refreshenv
```

### Paso 4: Verificar Instalación

```powershell
puppet --version
```

## 🎭 Aplicar Manifiestos

### Manifiesto Simple (Recomendado para Windows)

```powershell
puppet apply apache_simple.pp
```

### Verificar Resultado

```powershell
# Verificar que el archivo se creó
dir C:\xampp\htdocs\index.html

# Probar la página web
curl http://localhost/index.html
```

## 🚨 Solución de Problemas

### Problema: "puppet no se reconoce"

**Solución:**
```powershell
refreshenv
# O reiniciar PowerShell como administrador
```

### Problema: "Permission denied"

**Solución:**
- Asegúrate de ejecutar PowerShell como administrador
- Verifica que XAMPP esté funcionando

### Problema: "Invalid package provider"

**Solución:**
- Usar `apache_simple.pp` en lugar de `apache.pp`
- Este manifiesto no requiere proveedores especiales

### Problema: "Chocolatey installation failed"

**Solución:**
```powershell
# Ejecutar manualmente
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

## 📁 Archivos Específicos para Windows

- `apache_simple.pp` - Manifiesto optimizado para Windows
- `install_windows_fixed.bat` - Script de instalación corregido
- `WINDOWS_SETUP.md` - Esta guía

## 🎯 Diferencias con Linux

| Aspecto | Linux | Windows |
|---------|-------|---------|
| **Manifiesto** | `apache.pp` | `apache_simple.pp` |
| **Instalación** | `sudo apt-get install puppet` | `choco install puppet` |
| **Permisos** | `sudo` | Ejecutar como administrador |
| **Servicios** | `systemctl` | Panel de Control de XAMPP |
| **Rutas** | `/var/www/html/` | `C:\xampp\htdocs\` |

## ✅ Lista de Verificación

- [ ] PowerShell ejecutándose como administrador
- [ ] XAMPP funcionando correctamente
- [ ] Puppet instalado (`puppet --version`)
- [ ] Manifiesto aplicado sin errores
- [ ] Página web accesible en `http://localhost/index.html`

## 🎉 ¡Éxito!

Si todos los elementos de la lista están marcados, ¡has configurado exitosamente Puppet en Windows!

---

**Nota:** Esta configuración está optimizada para entornos educativos con XAMPP. Para entornos de producción, considera usar Puppet Agent/Server o Puppet Bolt.
