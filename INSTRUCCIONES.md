# ðŸŽ­ INSTRUCCIONES DE USO - PrÃ¡ctica de Puppet con Apache

## ðŸ“ Archivos Creados

âœ… apache.pp - Manifiesto simple para instalar Apache
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

**En Windows:**
`cmd
install.bat
`

### 2. Aplicar la ConfiguraciÃ³n

**OpciÃ³n A - Manifiesto Simple:**
`ash
sudo puppet apply apache.pp
`

**OpciÃ³n B - MÃ³dulo Completo:**
`ash
sudo puppet apply site.pp
`

### 3. Verificar el Resultado

`ash
# Verificar que Apache estÃ© corriendo
sudo systemctl status apache2

# Probar la pÃ¡gina web
curl http://localhost

# O abrir en el navegador: http://localhost
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
