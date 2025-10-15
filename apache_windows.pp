class apache_example {
  
  # 1. Instalar el paquete Apache (usando Chocolatey)
  package { 'apache-httpd':
    ensure   => installed,
    provider => chocolatey,
  }

  # 2. Asegurar que el servicio este activo y habilitado al iniciar
  service { 'Apache2.4':
    ensure     => running,
    enable     => true,
    require    => Package['apache-httpd'],
  }

  # 3. Crear una pagina web personalizada
  file { 'C:/xampp/htdocs/index.html':
    ensure  => file,
    content => "<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Mi servidor Puppet</title>
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
        <div class='puppet-logo'>🎭</div>
        <h1>¡Configurado automaticamente con Puppet!</h1>
        
        <div class='info'>
            <h3>Informacion del Servidor</h3>
            <p><strong>Servidor:</strong> Apache HTTP Server</p>
            <p><strong>Configurado por:</strong> Puppet</p>
            <p><strong>Modulo:</strong> apache_example</p>
            <p><strong>Estado:</strong> ✅ Funcionando correctamente</p>
            <p><strong>Sistema:</strong> Windows</p>
        </div>
    </div>
</body>
</html>",
    require => Package['apache-httpd'],
    notify  => Service['Apache2.4'],
  }
}

# Aplicar la clase
include apache_example
