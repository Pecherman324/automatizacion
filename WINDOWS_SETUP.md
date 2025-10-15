# 🪟 Configuración de Puppet en Windows

## 📋 Requisitos Previos

- ✅ Windows 10/11
- ✅ XAMPP instalado y funcionando
- ✅ Permisos de administrador
- ✅ Conexión a internet

## 🚀 Instalación Paso a Paso

### Paso 1: Ejecutar PowerShell como Administrador - INSTRUCCIONES DETALLADAS

**MÉTODO 1 (Recomendado):**
1. Presiona la tecla **Windows** en tu teclado
2. Escribe: `PowerShell`
3. **NO presiones Enter todavía**
4. Verás que aparece "Windows PowerShell" en los resultados de búsqueda
5. **Haz clic derecho** sobre "Windows PowerShell"
6. Selecciona **"Ejecutar como administrador"**
7. Aparecerá una ventana azul que dice "Administrador: Windows PowerShell"
8. Si te pregunta "¿Permitir que esta aplicación haga cambios en el dispositivo?", haz clic en **"Sí"**

**MÉTODO 2 (Alternativo):**
1. Presiona **Windows + X** al mismo tiempo
2. Selecciona **"Windows PowerShell (Administrador)"**
3. Confirma con **"Sí"** en el control de cuentas de usuario

**VERIFICACIÓN:** En la ventana de PowerShell deberías ver "Administrador:" al inicio de la línea de comandos

### Paso 2: Navegar al Proyecto - INSTRUCCIONES DETALLADAS

```powershell
# Escribe exactamente esto (copia y pega):
cd C:\xampp\htdocs\puppet

# Presiona Enter
# Deberías ver: PS C:\xampp\htdocs\puppet>
```

**VERIFICACIÓN:** Si ves un error como "No se puede encontrar la ruta", significa que:
1. XAMPP no está instalado en `C:\xampp\`
2. O el proyecto no está en esa ubicación
3. Verifica la ubicación real de tu proyecto

### Paso 3: Verificar que estás en la carpeta correcta

```powershell
# Escribe exactamente esto:
dir

# Presiona Enter
# Deberías ver archivos como: apache.pp, site.pp, install.bat, etc.
# Si no ves estos archivos, no estás en la carpeta correcta
```

### Paso 4: Instalar Puppet - INSTRUCCIONES DETALLADAS

**OPCIÓN A (Recomendada): Usar el script corregido**
```powershell
# Escribe exactamente esto:
.\install_windows_fixed.bat

# Presiona Enter
# Espera 5-10 minutos (puede parecer que se cuelga, pero está funcionando)
# Verás mensajes como: "Instalando Chocolatey...", "Instalando Puppet..."
```

**OPCIÓN B: Instalación manual (si la Opción A falla)**
```powershell
# 1. Instalar Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# 2. Instalar Puppet
choco install puppet -y

# 3. Refrescar entorno
refreshenv
```

### Paso 5: Verificar Instalación - INSTRUCCIONES DETALLADAS

```powershell
# Escribe exactamente esto:
puppet --version

# Presiona Enter
# Deberías ver algo como: 3.8.7
# Si ves un error, continúa al Paso 6
```

### Paso 6: Si hay problemas - SOLUCIÓN DETALLADA

```powershell
# Si "puppet" no se reconoce, escribe:
refreshenv

# Presiona Enter
# Espera 30 segundos

# Prueba de nuevo:
puppet --version

# Si aún no funciona, reinicia PowerShell como administrador y repite desde el Paso 2
```

## 🎭 Aplicar Manifiestos

### Manifiesto Simple (Recomendado para Windows) - INSTRUCCIONES DETALLADAS

```powershell
# PASO 1: Verificar que estás en la carpeta correcta
pwd
# Deberías ver: C:\xampp\htdocs\puppet

# PASO 2: Verificar que el archivo existe
dir apache_simple.pp
# Deberías ver apache_simple.pp en la lista

# PASO 3: Ejecutar el manifiesto
puppet apply apache_simple.pp
# Presiona Enter
# Espera 1-2 minutos
# Verás mensajes como: "Notice: Compiled catalog..."
```

### Verificar Resultado - INSTRUCCIONES DETALLADAS

```powershell
# PASO 1: Verificar que el archivo se creó
dir C:\xampp\htdocs\index.html
# Presiona Enter
# Deberías ver index.html con fecha de hoy

# PASO 2: Verificar que XAMPP está funcionando
# Abre "XAMPP Control Panel" desde el menú de Windows
# Busca "XAMPP Control Panel" en la búsqueda de Windows
# Verifica que Apache esté en "Running" (verde)
# Si no está corriendo, haz clic en "Start" junto a Apache

# PASO 3: Probar la página web desde terminal
curl http://localhost/index.html
# Presiona Enter
# Deberías ver código HTML con "Mi servidor Puppet"

# PASO 4: Abrir en el navegador
# Abre tu navegador web (Chrome, Firefox, Edge, etc.)
# Escribe en la barra de direcciones: http://localhost/index.html
# Presiona Enter
# Deberías ver una página bonita con gradiente azul y "¡Configurado automáticamente con Puppet!"

# PASO 5: Si no funciona, probar también:
# http://localhost (sin /index.html)
# http://127.0.0.1/index.html
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
