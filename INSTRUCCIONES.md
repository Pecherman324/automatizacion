# ðŸŽ­ INSTRUCCIONES DE USO - PrÃ¡ctica de Puppet con Apache

## ðŸ“ Archivos Creados

âœ… apache.pp - Manifiesto simple para instalar Apache (Linux)
âœ… apache_simple.pp - Manifiesto para Windows con XAMPP
âœ… site.pp - Manifiesto con mÃ³dulo completo
âœ… modules/apache_example/manifests/init.pp - Clase principal del mÃ³dulo
âœ… install.sh - Script de instalaciÃ³n para Linux
âœ… install.bat - Script de instalaciÃ³n para Windows
âœ… README.md - DocumentaciÃ³n completa

## ðŸš€ Pasos para Ejecutar

### 1. Instalar Puppet

**En Linux:**
`ash
chmod +x install.sh
./install.sh
`

**En Windows - INSTRUCCIONES SÚPER DETALLADAS:**
`cmd
# PASO 1: Abrir PowerShell como Administrador
# 1.1. Presiona la tecla Windows
# 1.2. Escribe: PowerShell
# 1.3. Haz clic derecho en "Windows PowerShell"
# 1.4. Selecciona "Ejecutar como administrador"
# 1.5. Confirma con "Sí"

# PASO 2: Navegar al proyecto
cd C:\xampp\htdocs\puppet
# Presiona Enter
# Deberías ver: PS C:\xampp\htdocs\puppet>

# PASO 3: Verificar que estás en la carpeta correcta
dir
# Presiona Enter
# Deberías ver: apache.pp, site.pp, install.bat, etc.

# PASO 4: Ejecutar la instalación
.\install_windows_fixed.bat
# Presiona Enter
# Espera 5-10 minutos

# PASO 5: Si hay problemas, refrescar el entorno
refreshenv
# Presiona Enter
# Espera 30 segundos

# PASO 6: Verificar instalación
puppet --version
# Presiona Enter
# Deberías ver: 3.8.7
`

### 2. Aplicar la ConfiguraciÃ³n

**OpciÃ³n A - Manifiesto Simple - PASO A PASO:**
`ash
# PARA LINUX:
# 1. Verificar que estás en la carpeta correcta
pwd
# Deberías ver: /ruta/a/tu/proyecto/puppet

# 2. Verificar que el archivo existe
ls -la apache.pp
# Deberías ver el archivo apache.pp

# 3. Ejecutar el manifiesto
sudo puppet apply apache.pp
# Presiona Enter
# Espera 1-2 minutos

# PARA WINDOWS:
# 1. Verificar que estás en la carpeta correcta
pwd
# Deberías ver: C:\xampp\htdocs\puppet

# 2. Verificar que el archivo existe
dir apache_simple.pp
# Deberías ver apache_simple.pp en la lista

# 3. Ejecutar el manifiesto
puppet apply apache_simple.pp
# Presiona Enter
# Espera 1-2 minutos
`

**OpciÃ³n B - MÃ³dulo Completo - PASO A PASO:**
`ash
# PARA LINUX:
# 1. Verificar que estás en la carpeta correcta
pwd

# 2. Verificar que el archivo existe
ls -la site.pp

# 3. Ejecutar el manifiesto
sudo puppet apply site.pp
# Presiona Enter
# Espera 2-3 minutos

# PARA WINDOWS: (Recomendamos usar Opción A)
# 1. Verificar que estás en la carpeta correcta
pwd

# 2. Verificar que el archivo existe
dir site.pp

# 3. Ejecutar el manifiesto (puede dar errores)
puppet apply site.pp
# Presiona Enter
# Si da errores, usa la Opción A
`

### 3. Verificar el Resultado

`ash
# PARA LINUX - VERIFICACIÓN COMPLETA:
# 1. Verificar que Apache está corriendo
sudo systemctl status apache2
# Presiona Enter
# Deberías ver: "Active: active (running)" en verde

# 2. Si Apache no está corriendo, iniciarlo
sudo systemctl start apache2
# Presiona Enter

# 3. Probar la página web desde terminal
curl http://localhost
# Presiona Enter
# Deberías ver código HTML

# 4. Abrir en el navegador
# Abre Chrome/Firefox y ve a: http://localhost

# PARA WINDOWS - VERIFICACIÓN COMPLETA:
# 1. Verificar que el archivo se creó
dir C:\xampp\htdocs\index.html
# Presiona Enter
# Deberías ver index.html con fecha de hoy

# 2. Verificar que XAMPP está funcionando
# Abre "XAMPP Control Panel" desde el menú de Windows
# Verifica que Apache esté en "Running" (verde)
# Si no está corriendo, haz clic en "Start"

# 3. Probar la página web desde terminal
curl http://localhost/index.html
# Presiona Enter
# Deberías ver código HTML

# 4. Abrir en el navegador
# Abre Chrome/Firefox/Edge y ve a: http://localhost/index.html
# Deberías ver una página bonita con gradiente azul
`

## ðŸŽ¯ Lo que AprenderÃ¡s

- âœ… InstalaciÃ³n y configuraciÃ³n de Apache con Puppet
- âœ… GestiÃ³n de servicios del sistema
- âœ… CreaciÃ³n de archivos y directorios
- âœ… DefiniciÃ³n de dependencias entre recursos
- âœ… Uso de parÃ¡metros en clases
- âœ… Estructura de mÃ³dulos de Puppet

## ðŸ”§ PersonalizaciÃ³n

Puedes modificar los parÃ¡metros en site.pp:

`puppet
class { 'apache_example':
  page_title    => 'Mi Sitio Personal',
  page_content  => 'Bienvenido a mi sitio web',
  ensure_service => 'running',
  enable_service => true,
}
`

## ðŸ› SoluciÃ³n de Problemas

- Si el paquete no se encuentra, verifica el nombre segÃºn tu distribuciÃ³n
- En CentOS/RHEL, el paquete se llama 'httpd' en lugar de 'apache2'
- AsegÃºrate de ejecutar con permisos de administrador (sudo)

Â¡Disfruta aprendiendo Puppet! ðŸŽ‰
