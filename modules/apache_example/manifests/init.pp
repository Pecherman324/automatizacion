# Clase principal del mÃ³dulo apache_example
# Configura un servidor Apache con pÃ¡gina personalizada
#
# @param page_title [String] TÃ­tulo de la pÃ¡gina web
# @param page_content [String] Contenido del cuerpo de la pÃ¡gina
# @param ensure_service [String] Estado del servicio (running/stopped)
# @param enable_service [Boolean] Si el servicio debe iniciarse al boot
#
class apache_example (
  String $page_title = 'Mi servidor Puppet',
  String $page_content = 'Â¡Configurado automÃ¡ticamente con Puppet!',
  String $ensure_service = 'running',
  Boolean $enable_service = true,
) {
  
  # 1ï¸âƒ£ Instalar el paquete Apache
  package { 'apache2':
    ensure => installed,
  }

  # 2ï¸âƒ£ Asegurar que el servicio estÃ© activo y habilitado al iniciar
  service { 'apache2':
    ensure     => $ensure_service,
    enable     => $enable_service,
    require    => Package['apache2'],
  }

  # 3ï¸âƒ£ Crear una pÃ¡gina web personalizada
  file { '/var/www/html/index.html':
    ensure  => file,
    content => "<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>$page_title</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 600px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 2.5em;
        }
        .puppet-logo {
            font-size: 4em;
            margin-bottom: 20px;
        }
        .info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class='container'>
        <div class='puppet-logo'>ðŸŽ­</div>
        <h1>$page_content</h1>
        
        <div class='info'>
            <h3>InformaciÃ³n del Servidor</h3>
            <p><strong>Servidor:</strong> Apache HTTP Server</p>
            <p><strong>Configurado por:</strong> Puppet</p>
            <p><strong>MÃ³dulo:</strong> apache_example</p>
            <p><strong>Estado:</strong> âœ… Funcionando correctamente</p>
        </div>
    </div>
</body>
</html>",
    require => Package['apache2'],
    notify  => Service['apache2'],
  }

  # 4ï¸âƒ£ Crear directorio de logs personalizado
  file { '/var/log/apache2/puppet-logs':
    ensure => directory,
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0755',
  }
}
