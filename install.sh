#!/bin/bash

# Script de instalaciÃ³n para la prÃ¡ctica de Puppet con Apache
# Este script instala Puppet y configura el entorno

echo "ðŸš€ Iniciando instalaciÃ³n de Puppet y configuraciÃ³n del entorno..."

# Verificar si estamos en Ubuntu/Debian
if [ -f /etc/debian_version ]; then
    echo "ðŸ“¦ Detectado sistema Ubuntu/Debian"
    
    # Actualizar repositorios
    echo "ðŸ”„ Actualizando repositorios..."
    sudo apt update
    
    # Instalar Puppet
    echo "ðŸ“¥ Instalando Puppet..."
    sudo apt install -y puppet
    
    # Verificar instalaciÃ³n
    echo "âœ… Verificando instalaciÃ³n de Puppet..."
    puppet --version
    
elif [ -f /etc/redhat-release ]; then
    echo "ðŸ“¦ Detectado sistema Red Hat/CentOS"
    
    # Instalar Puppet
    echo "ðŸ“¥ Instalando Puppet..."
    sudo yum install -y puppet
    
    # Verificar instalaciÃ³n
    echo "âœ… Verificando instalaciÃ³n de Puppet..."
    puppet --version
    
else
    echo "âŒ Sistema operativo no soportado por este script"
    echo "Por favor, instala Puppet manualmente segÃºn tu distribuciÃ³n"
    exit 1
fi

echo ""
echo "ðŸŽ‰ Â¡InstalaciÃ³n completada!"
echo ""
echo "ðŸ“‹ PrÃ³ximos pasos:"
echo "1. Ejecuta: sudo puppet apply apache.pp"
echo "2. O usa el mÃ³dulo: sudo puppet apply site.pp"
echo "3. Verifica con: curl http://localhost"
echo ""
