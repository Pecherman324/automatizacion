# Manifiesto principal del sitio
# Este archivo define la configuraciÃ³n para todos los nodos

# ConfiguraciÃ³n por defecto para todos los nodos
node default {
  # Aplicar el mÃ³dulo apache_example con configuraciÃ³n bÃ¡sica
  class { 'apache_example':
    page_title    => 'Servidor Web Corporativo',
    page_content  => 'Â¡Bienvenido a nuestro servidor configurado con Puppet!',
    ensure_service => 'running',
    enable_service => true,
  }
}

# ConfiguraciÃ³n especÃ­fica para servidores de desarrollo
node 'dev-server' {
  class { 'apache_example':
    page_title    => 'Servidor de Desarrollo',
    page_content  => 'Entorno de desarrollo - Configurado con Puppet',
    ensure_service => 'running',
    enable_service => true,
  }
}

# ConfiguraciÃ³n especÃ­fica para servidores de producciÃ³n
node 'prod-server' {
  class { 'apache_example':
    page_title    => 'Servidor de ProducciÃ³n',
    page_content  => 'Sistema de producciÃ³n - Configurado con Puppet',
    ensure_service => 'running',
    enable_service => true,
  }
}
