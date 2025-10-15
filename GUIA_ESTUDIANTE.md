# 🎓 GUÍA DEL ESTUDIANTE - Práctica de Puppet

## 🎯 ¿QUÉ VAS A APRENDER HOY?

En esta práctica vas a convertirte en un **DevOps Engineer** por un día. Aprenderás a usar **Puppet**, una herramienta que te permitirá configurar servidores de forma automática, como si fueras un mago de la tecnología.

### 🚀 **Tu Misión**
Configurar un servidor web Apache de forma completamente automática, sin tocar ni un botón manualmente.

---

## 🤔 ¿POR QUÉ ES IMPORTANTE ESTO?

### **El Problema Real**
Imagina que trabajas en una empresa y necesitas configurar 50 servidores web idénticos:
- ❌ **Manualmente**: 50 servidores × 2 horas = 100 horas de trabajo
- ❌ **Riesgo de errores**: Cada servidor podría quedar diferente
- ❌ **Mantenimiento**: Cambios manuales en cada servidor

### **La Solución con Puppet**
- ✅ **Automáticamente**: 50 servidores en 30 minutos
- ✅ **Sin errores**: Todos los servidores idénticos
- ✅ **Fácil mantenimiento**: Un cambio se aplica a todos

---

## 📋 PREPARACIÓN ANTES DE EMPEZAR

### **Lo que necesitas:**
- 💻 Una computadora con Linux/Windows
- 🌐 Conexión a internet
- 🔑 Permisos de administrador (sudo)
- 🧠 Mucha curiosidad

### **Lo que NO necesitas:**
- ❌ Conocimientos previos de Puppet
- ❌ Experiencia en servidores web
- ❌ Ser un experto en programación

---

## 🎬 PASO A PASO - ¡VAMOS A HACERLO!

### **PASO 1: Instalación (15 minutos)**

#### **En Linux (Ubuntu/Debian):**
```bash
# 1. Hacer el script ejecutable
chmod +x install.sh

# 2. Ejecutar la instalación
./install.sh

# 3. Verificar que Puppet se instaló
puppet --version
```

#### **En Windows:**
```cmd
# IMPORTANTE: Ejecutar PowerShell como Administrador
# 1. Clic derecho en PowerShell → "Ejecutar como administrador"
# 2. Navegar al proyecto
cd C:\xampp\htdocs\puppet

# 3. Ejecutar el archivo de instalación
.\install.bat

# 4. Si hay problemas, refrescar el entorno
refreshenv

# 5. Verificar instalación
puppet --version
```

### **PASO 2: Tu Primer Manifiesto (20 minutos)**

#### **¿Qué es un manifiesto?**
Un manifiesto es como una **receta de cocina** para tu servidor. Le dices a Puppet exactamente qué quieres que haga.

#### **Vamos a ver el archivo `apache.pp` (Linux) y `apache_simple.pp` (Windows):**

**Para Linux:**
```puppet
class apache_example {
  # 1️⃣ Instalar Apache
  package { 'apache2':
    ensure => installed,
  }

  # 2️⃣ Asegurar que esté funcionando
  service { 'apache2':
    ensure     => running,
    enable     => true,
    require    => Package['apache2'],
  }

  # 3️⃣ Crear una página web
  file { '/var/www/html/index.html':
    ensure  => file,
    content => "<html>
  <head><title>Mi servidor Puppet</title></head>
  <body><h1>¡Configurado automáticamente con Puppet!</h1></body>
</html>",
    require => Package['apache2'],
  }
}

# Aplicar la clase
include apache_example
```

**Para Windows (con XAMPP):**
```puppet
class apache_simple {
  # Crear una página web personalizada en XAMPP
  file { 'C:/xampp/htdocs/index.html':
    ensure  => file,
    content => "<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <title>Mi servidor Puppet</title>
    <style>
        body { font-family: Arial; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .container { background: white; padding: 40px; border-radius: 15px; text-align: center; }
    </style>
</head>
<body>
    <div class='container'>
        <h1>¡Configurado automáticamente con Puppet!</h1>
        <p>Servidor: Apache HTTP Server (XAMPP)</p>
        <p>Estado: ✅ Funcionando correctamente</p>
    </div>
</body>
</html>",
  }
}

# Aplicar la clase
include apache_simple
```

#### **¡Ahora vamos a ejecutarlo!**

**Para Linux:**
```bash
sudo puppet apply apache.pp
```

**Para Windows:**
```cmd
puppet apply apache_simple.pp
```

#### **🎉 ¡MAGIA! Verifica el resultado:**

**Para Linux:**
```bash
# Verificar que Apache está funcionando
sudo systemctl status apache2

# Probar la página web
curl http://localhost
```

**Para Windows:**
```cmd
# Verificar que el archivo se creó
dir C:\xampp\htdocs\index.html

# Probar la página web
curl http://localhost/index.html
# O abrir en el navegador: http://localhost/index.html
```

### **PASO 3: Módulo Avanzado (25 minutos)**

#### **¿Qué es un módulo?**
Un módulo es como una **caja de herramientas** completa. Tiene todo lo necesario para configurar un servicio específico.

#### **Explorando la estructura:**
```
modules/apache_example/
├── manifests/
│   └── init.pp          # La clase principal
├── templates/           # Plantillas para archivos
└── files/              # Archivos estáticos
```

#### **Vamos a usar el módulo completo:**
```bash
sudo puppet apply site.pp
```

#### **🔍 ¿Qué pasó diferente?**
- Se creó una página web más bonita
- Se configuraron parámetros personalizados
- Se creó un directorio de logs adicional

### **PASO 4: Personalización (15 minutos)**

#### **Modifica el archivo `site.pp`:**
```puppet
class { 'apache_example':
  page_title    => 'MI SITIO WEB PERSONAL',
  page_content  => '¡Hola! Este es mi servidor configurado con Puppet',
  ensure_service => 'running',
  enable_service => true,
}
```

#### **Aplica los cambios:**
```bash
sudo puppet apply site.pp
```

#### **🌐 Ve el resultado en tu navegador:**
Abre: `http://localhost`

---

## 🎯 EJERCICIOS PRÁCTICOS

### **Ejercicio 1: Personalización Básica**
Modifica el título y contenido de tu página web. ¿Qué cambios ves?

### **Ejercicio 2: Configuración de Múltiples Entornos**
Crea configuraciones diferentes para:
- 🏠 **Desarrollo**: "Servidor de Desarrollo - [Tu Nombre]"
- 🏢 **Producción**: "Servidor de Producción - [Tu Nombre]"

### **Ejercicio 3: Extensión del Módulo**
Agrega un nuevo directorio en `/var/www/html/mi-carpeta/` con permisos específicos.

---

## 🧠 CONCEPTOS CLAVE QUE APRENDISTE

### **1. Recursos de Puppet**
- **`package`**: Instala software
- **`service`**: Gestiona servicios del sistema
- **`file`**: Crea y modifica archivos

### **2. Dependencias**
- **`require`**: "Necesito que esto esté listo antes"
- **`notify`**: "Avisa cuando cambie esto"

### **3. Parámetros**
- Permiten personalizar el comportamiento
- Hacen el código reutilizable
- Facilitan el mantenimiento

### **4. Módulos**
- Estructura organizada y reutilizable
- Separación de responsabilidades
- Fácil de compartir y mantener

---

## 🚨 SOLUCIÓN DE PROBLEMAS

### **Problema: "Permission denied"**
```bash
# Solución: Usar sudo (Linux) o ejecutar como administrador (Windows)
# Linux:
sudo puppet apply apache.pp

# Windows: Ejecutar PowerShell como administrador
```

### **Problema: "Package not found"**
```bash
# En CentOS/RHEL, el paquete se llama 'httpd'
# Modifica el manifiesto:
package { 'httpd':
  ensure => installed,
}

# En Windows, usar el manifiesto apache_simple.pp que no instala paquetes
```

### **Problema: "Service won't start"**
```bash
# Linux: Verificar el estado
sudo systemctl status apache2

# Linux: Ver logs de error
sudo journalctl -u apache2

# Windows: Verificar que XAMPP esté funcionando
# Abrir Panel de Control de XAMPP
```

### **Problema: "Port already in use"**
```bash
# Linux: Ver qué está usando el puerto 80
sudo netstat -tlnp | grep :80

# Linux: Detener otros servicios web
sudo systemctl stop nginx

# Windows: Verificar que XAMPP Apache esté iniciado
```

### **Problema: "Puppet command not found" (Windows)**
```cmd
# Solución: Refrescar el entorno después de la instalación
refreshenv

# O reiniciar PowerShell como administrador
```

### **Problema: "Invalid package provider 'chocolatey'"**
```cmd
# Solución: Usar el manifiesto apache_simple.pp que no requiere proveedores especiales
puppet apply apache_simple.pp
```

---

## 🎉 ¡FELICITACIONES!

### **Lo que has logrado:**
- ✅ **Instalaste** Puppet en tu sistema
- ✅ **Creaste** tu primer manifiesto
- ✅ **Configuraste** un servidor web automáticamente
- ✅ **Personalizaste** la configuración con parámetros
- ✅ **Entendiste** los conceptos básicos de automatización

### **Habilidades que desarrollaste:**
- 🧠 **Pensamiento sistemático**: Planificar antes de actuar
- 🔧 **Resolución de problemas**: Debugging y troubleshooting
- 📚 **Aprendizaje autónomo**: Leer documentación y experimentar
- 🤝 **Trabajo colaborativo**: Compartir soluciones con compañeros

---

## 🚀 PRÓXIMOS PASOS

### **Para seguir aprendiendo:**
1. **Explora más recursos**: `user`, `group`, `cron`, `exec`
2. **Crea tu propio módulo**: Para un servicio que uses
3. **Experimenta con templates**: Archivos dinámicos con ERB
4. **Investiga otras herramientas**: Ansible, Chef, Terraform

### **Recursos recomendados:**
- 📖 [Documentación oficial de Puppet](https://puppet.com/docs/)
- 🎮 [Puppet Learning VM](https://puppet.com/try-puppet/puppet-learning-vm/)
- 🏪 [Puppet Forge](https://forge.puppet.com/) - Módulos de la comunidad
- 📺 [Videos tutoriales en YouTube](https://www.youtube.com/results?search_query=puppet+tutorial)

---

## 💭 REFLEXIÓN FINAL

### **Preguntas para pensar:**
- 🤔 ¿Cómo cambiaría tu trabajo si pudieras automatizar tareas repetitivas?
- 🤔 ¿Qué otros servicios podrías configurar con Puppet?
- 🤔 ¿Cómo te imaginas trabajando en un equipo de DevOps?

### **Tu opinión importa:**
- ¿Qué fue lo más interesante de esta práctica?
- ¿Qué te gustaría aprender más sobre automatización?
- ¿Tienes alguna pregunta que no se haya respondido?

---

## 🎓 EVALUACIÓN

### **Autoevaluación:**
- ✅ ¿Pudiste instalar Puppet sin problemas?
- ✅ ¿Ejecutaste los manifiestos correctamente?
- ✅ ¿Personalizaste la configuración?
- ✅ ¿Resolviste los problemas que surgieron?
- ✅ ¿Entiendes los conceptos básicos?

### **Si respondiste "Sí" a todo:**
🎉 **¡Eres oficialmente un DevOps Engineer en formación!**

### **Si algunas respuestas fueron "No":**
😊 **¡No te preocupes!** La automatización es un tema complejo. Sigue practicando y pregunta a tu profesor.

---

## 🤝 TRABAJO COLABORATIVO

### **Comparte con tus compañeros:**
- 💡 **Trucos** que descubriste
- 🐛 **Problemas** que resolviste
- 🚀 **Ideas** para mejorar la práctica
- 📚 **Recursos** que encontraste útiles

### **Ayuda a otros:**
- Si ves que alguien tiene problemas, ¡ofrécete a ayudar!
- Comparte tus soluciones en el chat de la clase
- Documenta los problemas que resolviste

---

**¡Que tengas una excelente práctica! 🚀**

*Recuerda: La automatización no es solo código, es una forma de pensar que te hará más eficiente en cualquier trabajo tecnológico.*
