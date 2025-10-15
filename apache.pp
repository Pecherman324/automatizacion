class apache_example {
  
  # 1ï¸âƒ£ Instalar el paquete Apache
  package { 'apache2':
    ensure => installed,
  }

  # 2ï¸âƒ£ Asegurar que el servicio estÃ© activo y habilitado al iniciar
  service { 'apache2':
    ensure     => running,
    enable     => true,
    require    => Package['apache2'],
  }

  # 3ï¸âƒ£ Crear una pÃ¡gina web personalizada
  file { '/var/www/html/index.html':
    ensure  => file,
    content => "<html>
  <head><title>Mi servidor Puppet</title></head>
  <body><h1>Â¡Configurado automÃ¡ticamente con Puppet!</h1></body>
</html>
",
    require => Package['apache2'],
  }
}

# Aplicar la clase
include apache_example
