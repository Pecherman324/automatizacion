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
- **Puppet como solución**: Automatización, consistencia, escalabilidad
- **Recursos básicos**: package, service, file
- **Dependencias**: require, notify
- **Parámetros**: Personalización y flexibilidad

#### **Demostración en Vivo (10 min)**
- Mostrar la diferencia entre configuración manual vs Puppet
- Ejecutar `puppet apply apache.pp` en tiempo real
- Verificar el resultado en el navegador

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
- Explicar `apache.pp` línea por línea
- Ejecutar: `sudo puppet apply apache.pp`
- Verificar resultado: `curl http://localhost`

**PARA ESTUDIANTES CON WINDOWS:**
- Explicar `apache_simple.pp` línea por línea
- Enfatizar que NO instala paquetes, solo crea archivos
- Ejecutar: `puppet apply apache_simple.pp`
- Verificar resultado: `curl http://localhost/index.html`

**PUNTOS CLAVE PARA EL DOCENTE:**
- ✅ Usar el manifiesto correcto según el sistema operativo
- ✅ Explicar por qué `apache_simple.pp` es diferente
- ✅ Verificar que XAMPP esté funcionando antes de aplicar el manifiesto
- ✅ Mostrar cómo abrir el Panel de Control de XAMPP

#### **Paso 3: Módulo Avanzado (25 min)**
- Explorar la estructura del módulo
- Explicar parámetros y personalización
- Modificar `site.pp` con diferentes valores
- Ejecutar: `sudo puppet apply site.pp`

#### **Paso 4: Verificación y Troubleshooting (15 min)**
- Verificar servicios: `systemctl status apache2`
- Revisar logs si hay problemas
- Probar la página web en el navegador

### **FASE 3: EJERCICIOS PRÁCTICOS (30-45 min)**

#### **Ejercicio 1: Personalización Básica**
Modificar el título y contenido de la página web

#### **Ejercicio 2: Configuración de Múltiples Nodos**
Crear configuraciones diferentes para desarrollo y producción

#### **Ejercicio 3: Extensión del Módulo**
Agregar un nuevo recurso (ej: crear un directorio adicional)

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
