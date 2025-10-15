# ðŸŽ­ PrÃ¡ctica de Puppet: ConfiguraciÃ³n de Servidor Apache

Esta prÃ¡ctica te enseÃ±arÃ¡ a usar Puppet para automatizar la instalaciÃ³n y configuraciÃ³n de un servidor web Apache.

## ðŸ“‹ Contenido del Proyecto

`
puppet-apache-practice/
â”œâ”€â”€ apache.pp                    # Manifiesto simple
â”œâ”€â”€ site.pp                      # Manifiesto con mÃ³dulo
â”œâ”€â”€ modules/
â”‚   â””â”€â”€ apache_example/
â”‚       â”œâ”€â”€ manifests/
â”‚       â”‚   â””â”€â”€ init.pp          # Clase principal del mÃ³dulo
â”‚       â”œâ”€â”€ templates/
â”‚       â”‚   â””â”€â”€ index.html.erb   # Template de la pÃ¡gina web
â”‚       â””â”€â”€ files/               # Archivos estÃ¡ticos
â”œâ”€â”€ install.sh                   # Script de instalaciÃ³n (Linux)
â”œâ”€â”€ install.bat                  # Script de instalaciÃ³n (Windows)
â”œâ”€â”€ apply.sh                     # Script de aplicaciÃ³n
â””â”€â”€ README.md                    # Esta documentaciÃ³n
`

## ðŸš€ InstalaciÃ³n RÃ¡pida

### En Linux (Ubuntu/Debian):
`ash
chmod +x install.sh apply.sh
./install.sh
`

### En Windows:
`cmd
install.bat
`

## ðŸ› ï¸ Uso

### OpciÃ³n 1: Manifiesto Simple
`ash
sudo puppet apply apache.pp
`

### OpciÃ³n 2: MÃ³dulo Completo
`ash
sudo puppet apply site.pp
`

## ðŸ” VerificaciÃ³n

DespuÃ©s de aplicar la configuraciÃ³n, verifica que todo funcione:

`ash
# Verificar estado del servicio
sudo systemctl status apache2

# Probar la pÃ¡gina web
curl http://localhost

# O abrir en el navegador
# http://localhost
`

## ðŸ“š Conceptos Aprendidos

### Tipos de Recursos de Puppet:
- **package**: Gestiona paquetes del sistema
- **service**: Gestiona servicios del sistema
- **ile**: Gestiona archivos y directorios

### CaracterÃ­sticas Avanzadas:
- **Dependencias**: equire, 
otify
- **ParÃ¡metros**: ConfiguraciÃ³n flexible
- **Templates**: Contenido dinÃ¡mico con ERB
- **Clases**: AgrupaciÃ³n de recursos
- **MÃ³dulos**: Estructura reutilizable

## ðŸŽ‰ Â¡Felicitaciones!

Has completado tu primera prÃ¡ctica de Puppet. Ahora sabes:
- âœ… Crear manifiestos bÃ¡sicos
- âœ… Usar recursos de Puppet
- âœ… Definir dependencias
- âœ… Crear mÃ³dulos reutilizables
- âœ… Usar templates y parÃ¡metros

Â¡ContinÃºa explorando Puppet para automatizar mÃ¡s infraestructura!
