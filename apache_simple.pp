# Manifiesto simple para configurar la pagina web con XAMPP
class apache_simple {
  
  # Crear una pagina web personalizada en XAMPP
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
        .success {
            color: #28a745;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class='container'>
        <div class='puppet-logo'>🎭</div>
        <h1>¡Configurado automaticamente con Puppet!</h1>
        
        <div class='info'>
            <h3>Informacion del Servidor</h3>
            <p><strong>Servidor:</strong> Apache HTTP Server (XAMPP)</p>
            <p><strong>Configurado por:</strong> Puppet</p>
            <p><strong>Modulo:</strong> apache_simple</p>
            <p><strong>Estado:</strong> <span class='success'>✅ Funcionando correctamente</span></p>
            <p><strong>Sistema:</strong> Windows</p>
            <p><strong>Fecha:</strong> $(Get-Date -Format 'dd/MM/yyyy HH:mm')</p>
        </div>
        
        <div class='info'>
            <h3>¡Felicitaciones!</h3>
            <p>Has configurado exitosamente tu primer servidor web usando Puppet.</p>
            <p>Esta es una demostracion practica de Infrastructure as Code (IaC).</p>
        </div>
    </div>
</body>
</html>",
  }
}

# Aplicar la clase
include apache_simple
