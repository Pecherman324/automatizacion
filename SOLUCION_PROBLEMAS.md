# 🚨 Guía Específica de Solución de Problemas

## 📋 Problemas Comunes y Soluciones Detalladas

### 🔧 **Problema 1: "puppet no se reconoce" (Windows)**

**SÍNTOMAS:**
- Escribes `puppet --version` y ves: "puppet : El término 'puppet' no se reconoce como nombre de un cmdlet, función, archivo de script o programa ejecutable"

**CAUSA:** Las variables de entorno no se actualizaron después de la instalación

**SOLUCIÓN PASO A PASO:**
```powershell
# PASO 1: Refrescar el entorno
refreshenv
# Presiona Enter
# Espera 30 segundos

# PASO 2: Probar de nuevo
puppet --version
# Presiona Enter
# Si aún no funciona, continúa al PASO 3

# PASO 3: Reiniciar PowerShell como administrador
# Cierra la ventana actual de PowerShell
# Repite el proceso de abrir PowerShell como administrador
# Navega de nuevo: cd C:\xampp\htdocs\puppet
# Prueba: puppet --version

# PASO 4: Si aún no funciona, reinstalar
.\install_windows_fixed.bat
```

---

### 🔧 **Problema 2: "Invalid package provider 'chocolatey'"**

**SÍNTOMAS:**
- Escribes `puppet apply apache.pp` y ves: "Invalid package provider 'chocolatey'"

**CAUSA:** El manifiesto `apache.pp` está diseñado para Linux, no para Windows

**SOLUCIÓN INMEDIATA:**
```powershell
# NO uses apache.pp, usa apache_simple.pp en su lugar
puppet apply apache_simple.pp
# Presiona Enter
# Este manifiesto NO requiere proveedores especiales
```

---

### 🔧 **Problema 3: "Permission denied" o "Access denied"**

**SÍNTOMAS:**
- Cualquier comando que falle con "Permission denied" o "Access denied"

**CAUSA:** No estás ejecutando PowerShell como administrador

**SOLUCIÓN PASO A PASO:**
```powershell
# PASO 1: Verificar que estás como administrador
# En la ventana de PowerShell, deberías ver: "Administrador: Windows PowerShell"
# Si NO dice "Administrador", cierra y abre de nuevo como administrador

# PASO 2: Verificar permisos
whoami
# Presiona Enter
# Deberías ver tu nombre de usuario

# PASO 3: Si sigues teniendo problemas, ejecutar:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Presiona Enter
# Escribe: Y
# Presiona Enter
```

---

### 🔧 **Problema 4: "No se puede encontrar la ruta"**

**SÍNTOMAS:**
- Escribes `cd C:\xampp\htdocs\puppet` y ves: "No se puede encontrar la ruta"

**CAUSA:** XAMPP no está instalado o el proyecto no está en esa ubicación

**SOLUCIÓN PASO A PASO:**
```powershell
# PASO 1: Verificar si XAMPP está instalado
dir C:\xampp
# Presiona Enter
# Si ves "No se puede encontrar la ruta", XAMPP no está instalado

# PASO 2: Si XAMPP no está instalado, instalarlo
# Ve a: https://www.apachefriends.org/
# Descarga XAMPP para Windows
# Instálalo en C:\xampp\

# PASO 3: Verificar la ubicación del proyecto
# Busca tu carpeta "puppet" en el Explorador de Archivos
# Copia la ruta completa
# Úsala en lugar de C:\xampp\htdocs\puppet
```

---

### 🔧 **Problema 5: "Chocolatey installation failed"**

**SÍNTOMAS:**
- El script de instalación falla al instalar Chocolatey

**CAUSA:** Políticas de ejecución de PowerShell o problemas de red

**SOLUCIÓN PASO A PASO:**
```powershell
# PASO 1: Cambiar política de ejecución
Set-ExecutionPolicy Bypass -Scope Process -Force
# Presiona Enter

# PASO 2: Instalar Chocolatey manualmente
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# Presiona Enter
# Espera a que termine

# PASO 3: Instalar Puppet
choco install puppet -y
# Presiona Enter
# Espera a que termine

# PASO 4: Refrescar entorno
refreshenv
# Presiona Enter
```

---

### 🔧 **Problema 6: La página web no se muestra**

**SÍNTOMAS:**
- El manifiesto se ejecuta correctamente pero no ves la página web

**CAUSA:** XAMPP Apache no está funcionando o el archivo no se creó

**SOLUCIÓN PASO A PASO:**
```powershell
# PASO 1: Verificar que el archivo se creó
dir C:\xampp\htdocs\index.html
# Presiona Enter
# Deberías ver index.html con fecha de hoy

# PASO 2: Si el archivo no existe, ejecutar el manifiesto de nuevo
puppet apply apache_simple.pp
# Presiona Enter

# PASO 3: Verificar que XAMPP está funcionando
# Abre "XAMPP Control Panel" desde el menú de Windows
# Verifica que Apache esté en "Running" (verde)
# Si no está corriendo, haz clic en "Start" junto a Apache

# PASO 4: Probar diferentes URLs
# http://localhost/index.html
# http://localhost
# http://127.0.0.1/index.html
```

---

### 🔧 **Problema 7: "Package 'apache2' not found" (Linux)**

**SÍNTOMAS:**
- En Linux, el manifiesto falla al instalar Apache

**CAUSA:** El nombre del paquete varía según la distribución

**SOLUCIÓN:**
```bash
# Para Ubuntu/Debian (usa apache2):
sudo puppet apply apache.pp

# Para CentOS/RHEL (usa httpd):
# Modifica el manifiesto o usa:
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
```

---

### 🔧 **Problema 8: "Port 80 already in use"**

**SÍNTOMAS:**
- Apache no puede iniciar porque el puerto 80 está ocupado

**CAUSA:** Otro servicio web está usando el puerto 80

**SOLUCIÓN:**
```bash
# Linux: Ver qué está usando el puerto 80
sudo netstat -tlnp | grep :80

# Linux: Detener otros servicios web
sudo systemctl stop nginx
sudo systemctl stop apache2
sudo systemctl start apache2

# Windows: Verificar XAMPP Control Panel
# Detener otros servicios web si es necesario
```

---

## 📞 **¿Necesitas Más Ayuda?**

### **Pasos de Diagnóstico:**
1. **Verifica que estás en la carpeta correcta:** `pwd`
2. **Verifica que los archivos existen:** `dir` (Windows) o `ls -la` (Linux)
3. **Verifica que Puppet está instalado:** `puppet --version`
4. **Verifica que estás como administrador:** La ventana debe decir "Administrador"

### **Información para Reportar Problemas:**
- Sistema operativo (Windows 10/11, Ubuntu, etc.)
- Versión de Puppet: `puppet --version`
- Mensaje de error completo
- Pasos que seguiste antes del error

### **Recursos Adicionales:**
- [Documentación oficial de Puppet](https://puppet.com/docs/)
- [Puppet Learning VM](https://puppet.com/try-puppet/puppet-learning-vm/)
- [Foro de la comunidad de Puppet](https://community.puppet.com/)

---

**¡Recuerda: La mayoría de problemas se solucionan ejecutando PowerShell como administrador y usando el manifiesto correcto para tu sistema operativo!** 🚀
