# 🎓 GUÍA DOCENTE - Práctica de Puppet: Automatización de Infraestructura

## 📋 INFORMACIÓN GENERAL DE LA PRÁCTICA

### 🎯 **Objetivo Principal**
Enseñar a los estudiantes los fundamentos de la automatización de infraestructura usando Puppet, específicamente para configurar un servidor web Apache de manera automatizada y reproducible.

### 🎓 **Competencias que se Desarrollan**
- **Técnicas**: Automatización de infraestructura, gestión de configuración, DevOps
- **Transversales**: Resolución de problemas, pensamiento sistemático, trabajo colaborativo
- **Profesionales**: Preparación para roles de DevOps, SysAdmin, Cloud Engineer

### ⏱️ **Duración Estimada**
- **Sesión teórica**: 30-45 minutos
- **Práctica guiada**: 60-90 minutos
- **Ejercicios adicionales**: 30-45 minutos
- **Total**: 2-3 horas de clase

---

## 🎯 OBJETIVOS DE APRENDIZAJE

### Al finalizar esta práctica, los estudiantes serán capaces de:

#### **Conceptuales**
- ✅ Explicar qué es Puppet y su importancia en DevOps
- ✅ Entender el concepto de "Infrastructure as Code" (IaC)
- ✅ Comprender la diferencia entre configuración manual vs automatizada
- ✅ Identificar los beneficios de la automatización de infraestructura

#### **Procedimentales**
- ✅ Instalar y configurar Puppet en su sistema
- ✅ Crear manifiestos básicos de Puppet
- ✅ Aplicar configuraciones usando `puppet apply`
- ✅ Gestionar recursos (packages, services, files)
- ✅ Definir dependencias entre recursos
- ✅ Crear módulos reutilizables
- ✅ Usar parámetros para personalizar configuraciones

#### **Actitudinales**
- ✅ Valorar la importancia de la automatización en entornos profesionales
- ✅ Desarrollar hábitos de documentación y versionado
- ✅ Apreciar la reproducibilidad y consistencia en infraestructura
- ✅ Fomentar el trabajo colaborativo y el intercambio de conocimiento

---

## 📚 CONTENIDO TEÓRICO PREVIO

### **Conceptos que los estudiantes deben conocer antes de la práctica:**

#### 1. **¿Qué es Puppet?**
- Herramienta de automatización de infraestructura
- Permite definir el estado deseado de los sistemas
- Garantiza consistencia y reproducibilidad
- Reduce errores humanos en configuraciones

#### 2. **Infrastructure as Code (IaC)**
- Tratar la infraestructura como código
- Versionado y control de cambios
- Reproducibilidad entre entornos
- Colaboración en equipos

#### 3. **Conceptos Clave de Puppet**
- **Manifiestos**: Archivos .pp que definen la configuración
- **Recursos**: Elementos del sistema (packages, services, files)
- **Clases**: Agrupaciones lógicas de recursos
- **Módulos**: Estructuras reutilizables y organizadas
- **Dependencias**: Relaciones entre recursos (require, notify)

---

## 🚀 ESTRUCTURA DE LA CLASE

### **FASE 1: INTRODUCCIÓN TEÓRICA (30-45 min)**

#### **Presentación del Problema (10 min)**
```
"Imaginen que tienen que configurar 100 servidores web idénticos.
¿Cuánto tiempo tomaría hacerlo manualmente?
¿Qué pasaría si se equivocan en uno?
¿Cómo garantizan que todos sean iguales?"
```

#### **Conceptos Fundamentales (20-25 min)**

**Puppet como solución:**
Puppet es una herramienta de automatización que permite definir el estado deseado de los sistemas. En lugar de ejecutar comandos manualmente, escribes código que describe cómo quieres que esté configurado tu sistema. Puppet se encarga de hacer que el sistema coincida con esa descripción.

**Recursos básicos:**
- **package**: Instala o desinstala software. Ejemplo: `package { 'apache2': ensure => installed }`
- **service**: Gestiona servicios del sistema. Ejemplo: `service { 'apache2': ensure => running }`
- **file**: Crea, modifica o elimina archivos. Ejemplo: `file { '/var/www/html/index.html': content => 'contenido' }`

**Dependencias:**
- **require**: Indica que un recurso necesita que otro esté listo antes. Ejemplo: `require => Package['apache2']`
- **notify**: Indica que cuando un recurso cambia, debe notificar a otro. Ejemplo: `notify => Service['apache2']`

**Parámetros:**
Los parámetros permiten personalizar el comportamiento de las clases. En lugar de tener código fijo, puedes pasar valores diferentes. Ejemplo: `page_title => 'Mi Sitio Web'`

#### **Demostración en Vivo (10 min)**

**Mostrar la diferencia entre configuración manual vs Puppet:**
1. **Configuración manual**: Mostrar cómo instalar Apache manualmente:
   ```bash
   sudo apt-get update
   sudo apt-get install apache2
   sudo systemctl start apache2
   sudo systemctl enable apache2
   echo "<html><body>Hola Mundo</body></html>" > /var/www/html/index.html
   ```
   Explicar que esto toma tiempo y es propenso a errores.

2. **Configuración con Puppet**: Mostrar el manifiesto `apache.pp`:
   ```puppet
   class apache_example {
     package { 'apache2': ensure => installed }
     service { 'apache2': 
       ensure => running,
       enable => true,
       require => Package['apache2']
     }
     file { '/var/www/html/index.html':
       content => '<html><body>¡Configurado con Puppet!</body></html>',
       require => Package['apache2']
     }
   }
   include apache_example
   ```

**Ejecutar `puppet apply apache.pp` en tiempo real:**
- Mostrar cómo Puppet instala Apache automáticamente
- Explicar los mensajes que aparecen en pantalla
- Destacar la velocidad y precisión del proceso

**Verificar el resultado en el navegador:**
- Abrir `http://localhost` en el navegador
- Mostrar la página web creada automáticamente
- Explicar que esto se puede repetir en cualquier servidor

### **FASE 2: PRÁCTICA GUIADA (60-90 min)**

#### **Paso 1: Preparación del Entorno (15 min) - INSTRUCCIONES ESPECÍFICAS PARA EL DOCENTE**

**PARA ESTUDIANTES CON LINUX:**
```bash
# Los estudiantes ejecutan:
chmod +x install.sh
./install.sh
```

**PARA ESTUDIANTES CON WINDOWS - INSTRUCCIONES DETALLADAS:**
```cmd
# PASO 1: Verificar que XAMPP esté instalado
# Los estudiantes deben tener XAMPP instalado en C:\xampp\
# Si no lo tienen, dirigirlos a: https://www.apachefriends.org/

# PASO 2: Abrir PowerShell como administrador
# Enfatizar la importancia de ejecutar como administrador
# Mostrar cómo hacer clic derecho en PowerShell

# PASO 3: Navegar al proyecto
cd C:\xampp\htdocs\puppet

# PASO 4: Ejecutar instalación
.\install_windows_fixed.bat

# PASO 5: Si hay problemas
refreshenv
```

**PUNTOS CLAVE PARA EL DOCENTE:**
- ✅ Verificar que todos los estudiantes tienen XAMPP instalado
- ✅ Enfatizar la importancia de ejecutar PowerShell como administrador
- ✅ Tener preparado el archivo `SOLUCION_PROBLEMAS.md` para consulta rápida
- ✅ Usar `apache_simple.pp` para estudiantes con Windows

#### **Paso 2: Primer Manifiesto (20 min) - INSTRUCCIONES ESPECÍFICAS PARA EL DOCENTE**

**PARA ESTUDIANTES CON LINUX:**

**Explicar `apache.pp` línea por línea:**
```puppet
class apache_example {
  # Línea 1: Instalar el paquete Apache
  package { 'apache2':
    ensure => installed,  # Asegurar que esté instalado
  }

  # Línea 2: Configurar el servicio Apache
  service { 'apache2':
    ensure     => running,  # Asegurar que esté corriendo
    enable     => true,     # Habilitar para que inicie automáticamente
    require    => Package['apache2'],  # Esperar a que el paquete esté instalado
  }

  # Línea 3: Crear la página web
  file { '/var/www/html/index.html':
    ensure  => file,  # Asegurar que sea un archivo
    content => "<html>
  <head><title>Mi servidor Puppet</title></head>
  <body><h1>¡Configurado automáticamente con Puppet!</h1></body>
</html>",
    require => Package['apache2'],  # Esperar a que Apache esté instalado
  }
}

# Aplicar la clase
include apache_example
```

**Ejecutar:** `sudo puppet apply apache.pp`
**Verificar resultado:** `curl http://localhost`

**PARA ESTUDIANTES CON WINDOWS:**

**Explicar `apache_simple.pp` línea por línea:**
```puppet
class apache_simple {
  # Crear una página web personalizada en XAMPP
  file { 'C:/xampp/htdocs/index.html':
    ensure  => file,  # Asegurar que sea un archivo
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

**Enfatizar que NO instala paquetes, solo crea archivos:**
- Este manifiesto asume que XAMPP ya está instalado
- Solo crea el archivo `index.html` en la carpeta de XAMPP
- No necesita permisos especiales para instalar software
- Es más seguro y rápido para entornos educativos

**Ejecutar:** `puppet apply apache_simple.pp`
**Verificar resultado:** `curl http://localhost/index.html`

**PUNTOS CLAVE PARA EL DOCENTE:**
- ✅ Usar el manifiesto correcto según el sistema operativo
- ✅ Explicar por qué `apache_simple.pp` es diferente
- ✅ Verificar que XAMPP esté funcionando antes de aplicar el manifiesto
- ✅ Mostrar cómo abrir el Panel de Control de XAMPP

#### **Paso 3: Módulo Avanzado (25 min)**

**Explorar la estructura del módulo:**
```
modules/apache_example/
├── manifests/
│   └── init.pp          # La clase principal del módulo
├── templates/           # Plantillas ERB para archivos dinámicos
└── files/              # Archivos estáticos que se copian
```

**Explicar parámetros y personalización:**
El módulo `apache_example` acepta parámetros que permiten personalizar el comportamiento:

```puppet
class apache_example (
  String $page_title = 'Mi servidor Puppet',           # Título de la página
  String $page_content = '¡Configurado automáticamente con Puppet!',  # Contenido
  String $ensure_service = 'running',                  # Estado del servicio
  Boolean $enable_service = true,                      # Si se inicia automáticamente
) {
  # El código usa estas variables: $page_title, $page_content, etc.
}
```

**Modificar `site.pp` con diferentes valores:**
```puppet
# Configuración por defecto
node default {
  class { 'apache_example':
    page_title    => 'Servidor Web Corporativo',
    page_content  => '¡Bienvenido a nuestro servidor configurado con Puppet!',
    ensure_service => 'running',
    enable_service => true,
  }
}

# Configuración para desarrollo
node 'dev-server' {
  class { 'apache_example':
    page_title    => 'Servidor de Desarrollo',
    page_content  => 'Entorno de desarrollo - Configurado con Puppet',
    ensure_service => 'running',
    enable_service => true,
  }
}
```

**Ejecutar:** `sudo puppet apply site.pp`

#### **Paso 4: Verificación y Troubleshooting (15 min)**

**Verificar servicios:**
```bash
# Linux: Verificar que Apache está funcionando
sudo systemctl status apache2
# Deberías ver: "Active: active (running)" en verde

# Windows: Verificar XAMPP
# Abrir XAMPP Control Panel
# Verificar que Apache esté en "Running" (verde)
```

**Revisar logs si hay problemas:**
```bash
# Linux: Ver logs de Apache
sudo journalctl -u apache2
sudo tail -f /var/log/apache2/error.log

# Windows: Ver logs de XAMPP
# Ir a C:\xampp\apache\logs\error.log
```

**Probar la página web en el navegador:**
- **Linux:** Abrir `http://localhost` en el navegador
- **Windows:** Abrir `http://localhost/index.html` en el navegador
- Verificar que se muestra la página personalizada
- Explicar que esto demuestra que Puppet funcionó correctamente

### **FASE 3: EJERCICIOS PRÁCTICOS (30-45 min)**

#### **Ejercicio 1: Personalización Básica**
**Objetivo:** Modificar el título y contenido de la página web

**Instrucciones para los estudiantes:**
1. Abrir el archivo `site.pp`
2. Cambiar los valores de `page_title` y `page_content`:
   ```puppet
   class { 'apache_example':
     page_title    => 'MI SITIO WEB PERSONAL',
     page_content  => '¡Hola! Este es mi servidor configurado con Puppet',
     ensure_service => 'running',
     enable_service => true,
   }
   ```
3. Ejecutar: `sudo puppet apply site.pp`
4. Verificar en el navegador que los cambios se aplicaron

#### **Ejercicio 2: Configuración de Múltiples Nodos**
**Objetivo:** Crear configuraciones diferentes para desarrollo y producción

**Instrucciones para los estudiantes:**
1. Modificar `site.pp` para tener dos configuraciones:
   ```puppet
   # Configuración para desarrollo
   node 'dev-server' {
     class { 'apache_example':
       page_title    => 'Servidor de Desarrollo - [Tu Nombre]',
       page_content  => 'Entorno de desarrollo - Configurado con Puppet',
       ensure_service => 'running',
       enable_service => true,
     }
   }

   # Configuración para producción
   node 'prod-server' {
     class { 'apache_example':
       page_title    => 'Servidor de Producción - [Tu Nombre]',
       page_content  => 'Sistema de producción - Configurado con Puppet',
       ensure_service => 'running',
       enable_service => true,
     }
   }
   ```
2. Explicar cómo Puppet puede aplicar configuraciones diferentes según el nodo

#### **Ejercicio 3: Extensión del Módulo**
**Objetivo:** Agregar un nuevo recurso (ej: crear un directorio adicional)

**Instrucciones para los estudiantes:**
1. Modificar el módulo para agregar un directorio:
   ```puppet
   # Agregar esto dentro de la clase apache_example
   file { '/var/www/html/mi-carpeta':
     ensure => directory,
     owner  => 'www-data',
     group  => 'www-data',
     mode   => '0755',
   }
   ```
2. Explicar los parámetros:
   - `ensure => directory`: Crear un directorio
   - `owner` y `group`: Propietario del directorio
   - `mode`: Permisos (0755 = lectura, escritura, ejecución para propietario; lectura y ejecución para otros)
3. Ejecutar el manifiesto y verificar que se creó el directorio

---

## 🛠️ MATERIALES Y RECURSOS

### **Para el Docente**
- ✅ Presentación con conceptos teóricos
- ✅ Máquina virtual con Puppet preinstalado para demostración
- ✅ Acceso a internet para mostrar documentación oficial
- ✅ Lista de troubleshooting común

### **Para los Estudiantes**
- ✅ Computadoras con acceso a terminal/consola
- ✅ Conexión a internet
- ✅ Permisos de administrador (sudo)
- ✅ Navegador web para verificar resultados

### **Archivos del Proyecto**
- ✅ `apache.pp` - Manifiesto simple
- ✅ `site.pp` - Manifiesto con módulo
- ✅ `modules/apache_example/` - Módulo completo
- ✅ `install.sh` - Script de instalación
- ✅ Documentación completa

---

## 🎯 CRITERIOS DE EVALUACIÓN

### **Evaluación Formativa (Durante la clase)**
- ✅ Participación en discusiones teóricas
- ✅ Completitud de ejercicios prácticos
- ✅ Capacidad de resolver problemas básicos
- ✅ Comprensión de conceptos explicados

### **Evaluación Sumativa (Al final)**
- ✅ **Práctica individual** (40%): Configurar un servidor con parámetros específicos
- ✅ **Cuestionario conceptual** (30%): Preguntas sobre Puppet e IaC
- ✅ **Proyecto grupal** (30%): Extender el módulo con nuevas funcionalidades

### **Rúbrica de Evaluación**

| Criterio | Excelente (4) | Bueno (3) | Satisfactorio (2) | Necesita Mejora (1) |
|----------|---------------|-----------|-------------------|---------------------|
| **Comprensión Conceptual** | Explica claramente Puppet e IaC | Entiende conceptos básicos | Conoce algunos conceptos | Dificultad para entender |
| **Ejecución Técnica** | Completa todos los pasos sin ayuda | Completa con mínima ayuda | Necesita ayuda moderada | Requiere mucha asistencia |
| **Resolución de Problemas** | Identifica y resuelve errores | Resuelve con algunas pistas | Necesita guía para resolver | No puede resolver problemas |
| **Aplicación Práctica** | Extiende funcionalidad creativamente | Modifica parámetros correctamente | Sigue instrucciones básicas | Dificultad para aplicar |

---

## 🚨 TROUBLESHOOTING COMÚN

### **Problemas Frecuentes y Soluciones - GUÍA ESPECÍFICA PARA EL DOCENTE**

#### **1. Error de Permisos**
```bash
# Linux: Permission denied
# Solución: Usar sudo
sudo puppet apply apache.pp

# Windows: Access denied
# Solución: Ejecutar PowerShell como administrador
# Verificar que la ventana dice "Administrador: Windows PowerShell"
```

#### **2. Paquete No Encontrado**
```bash
# Linux: Package 'apache2' not found
# Solución: Verificar nombre del paquete según distribución
# Ubuntu/Debian: apache2
# CentOS/RHEL: httpd

# Windows: Invalid package provider 'chocolatey'
# Solución: Usar apache_simple.pp en lugar de apache.pp
puppet apply apache_simple.pp
```

#### **3. Servicio No Inicia**
```bash
# Linux: Verificar estado del servicio
sudo systemctl status apache2
sudo journalctl -u apache2

# Windows: Verificar XAMPP
# Abrir XAMPP Control Panel
# Verificar que Apache esté en "Running" (verde)
# Si no está corriendo, hacer clic en "Start"
```

#### **4. Puerto Ocupado**
```bash
# Linux: Verificar qué está usando el puerto 80
sudo netstat -tlnp | grep :80
sudo systemctl stop nginx

# Windows: Verificar XAMPP Control Panel
# Detener otros servicios web si es necesario
```

#### **5. "Puppet command not found" (Windows)**
```cmd
# Solución paso a paso:
refreshenv
# Si no funciona, reiniciar PowerShell como administrador
# Si aún no funciona, reinstalar: .\install_windows_fixed.bat
```

#### **6. La página web no se muestra**
```cmd
# Windows: Verificar que el archivo se creó
dir C:\xampp\htdocs\index.html

# Verificar que XAMPP está funcionando
# Probar diferentes URLs: http://localhost/index.html
```

---

## 🔄 EXTENSIONES Y VARIACIONES

### **Para Estudiantes Avanzados**
- ✅ Crear un módulo para Nginx en lugar de Apache
- ✅ Implementar configuración de base de datos MySQL
- ✅ Agregar monitoreo con herramientas como Nagios
- ✅ Crear un entorno completo LAMP (Linux, Apache, MySQL, PHP)

### **Para Diferentes Niveles**
- ✅ **Básico**: Solo ejecutar los manifiestos existentes
- ✅ **Intermedio**: Modificar parámetros y personalizar
- ✅ **Avanzado**: Crear nuevos módulos y funcionalidades

### **Integración con Otras Tecnologías**
- ✅ Docker: Containerizar la aplicación
- ✅ Git: Versionado de configuraciones
- ✅ CI/CD: Automatización de despliegues
- ✅ Cloud: Despliegue en AWS/Azure/GCP

---

## 📈 SEGUIMIENTO POST-CLASE

### **Actividades de Refuerzo**
- ✅ **Tarea individual**: Documentar el proceso aprendido
- ✅ **Proyecto grupal**: Automatizar otro servicio (ej: MySQL, Nginx)
- ✅ **Presentación**: Explicar beneficios de Puppet a la clase
- ✅ **Investigación**: Comparar Puppet con otras herramientas (Ansible, Chef)

### **Recursos Adicionales**
- ✅ [Documentación oficial de Puppet](https://puppet.com/docs/)
- ✅ [Puppet Learning VM](https://puppet.com/try-puppet/puppet-learning-vm/)
- ✅ [Puppet Forge](https://forge.puppet.com/) - Módulos de la comunidad
- ✅ [Puppet Best Practices](https://puppet.com/docs/puppet/latest/style_guide.html)

---

## 🎉 CONCLUSIÓN

Esta práctica introduce a los estudiantes al mundo de la automatización de infraestructura, una competencia esencial en el mercado laboral actual. Al completar esta actividad, los estudiantes habrán:

- ✅ **Experimentado** la potencia de Puppet en primera persona
- ✅ **Comprendido** los beneficios de la automatización
- ✅ **Desarrollado** habilidades técnicas valiosas
- ✅ **Preparado** para roles profesionales en DevOps

### **Mensaje Final para los Estudiantes**
*"La automatización no es solo una herramienta técnica, es una forma de pensar. En un mundo donde la infraestructura crece exponencialmente, saber automatizar no es opcional, es esencial. ¡Han dado el primer paso hacia una carrera en DevOps!"*

---

## 📞 CONTACTO Y SOPORTE

Para dudas sobre la implementación de esta práctica:
- 📧 Email: [tu-email@institucion.edu]
- 💬 Slack/Teams: [canal-de-soporte]
- 📚 Documentación: [enlace-a-recursos-adicionales]

**¡Que tengan una excelente clase! 🚀**
