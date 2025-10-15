# 🎭 Proyecto de Automatización con Puppet

## 📋 Descripción del Proyecto

Este repositorio contiene un **proyecto educativo completo** para enseñar automatización de infraestructura usando Puppet. Incluye materiales para docentes, estudiantes y una práctica hands-on para configurar un servidor web Apache de forma automatizada.

## 🎯 Objetivo Educativo

**Propósito**: Enseñar a los estudiantes los fundamentos de la automatización de infraestructura, preparándolos para roles profesionales en DevOps, Cloud Engineering y Systems Administration.

**Competencias desarrolladas**:
- 🤖 Automatización de infraestructura
- 🏗️ Infrastructure as Code (IaC)
- 🔧 Gestión de configuración
- 🚀 Habilidades DevOps
- 🐛 Resolución de problemas técnicos

## 📚 Contenido del Repositorio

### 🎓 **Materiales Educativos**

#### Para Docentes:
- 📖 [`GUIA_DOCENTE.md`](GUIA_DOCENTE.md) - Guía completa para profesores
- 🎯 [`PRESENTACION_CLASE.md`](PRESENTACION_CLASE.md) - Presentación con 21 diapositivas
- 📊 [`GUIA_EVALUACION.md`](GUIA_EVALUACION.md) - Sistema de evaluación y rúbricas

#### Para Estudiantes:
- 📚 [`GUIA_ESTUDIANTE.md`](GUIA_ESTUDIANTE.md) - Guía paso a paso para estudiantes
- 📋 [`INSTRUCCIONES.md`](INSTRUCCIONES.md) - Instrucciones de uso del proyecto

### 🔧 **Código de Puppet**

#### Manifiestos:
- 📄 [`apache.pp`](apache.pp) - Manifiesto simple para instalar Apache
- 🏗️ [`site.pp`](site.pp) - Manifiesto con módulo completo

#### Módulos:
- 📦 [`modules/apache_example/`](modules/apache_example/) - Módulo completo de Apache
  - [`manifests/init.pp`](modules/apache_example/manifests/init.pp) - Clase principal
  - [`templates/`](modules/apache_example/templates/) - Plantillas ERB
  - [`files/`](modules/apache_example/files/) - Archivos estáticos

#### Scripts de Instalación:
- 🐧 [`install.sh`](install.sh) - Script de instalación para Linux
- 🪟 [`install.bat`](install.bat) - Script de instalación para Windows

## 🚀 Inicio Rápido

### Prerrequisitos
- Sistema operativo Linux (Ubuntu/Debian) o Windows
- Permisos de administrador (sudo)
- Conexión a internet

### Instalación

#### En Linux:
```bash
# Clonar el repositorio
git clone https://github.com/Pecherman324/automatizacion.git
cd automatizacion

# Hacer ejecutables los scripts
chmod +x install.sh

# Instalar Puppet
./install.sh
```

#### En Windows:
```cmd
# Clonar el repositorio
git clone https://github.com/Pecherman324/automatizacion.git
cd automatizacion

# Instalar Puppet
install.bat
```

### Uso

#### Opción 1: Manifiesto Simple
```bash
sudo puppet apply apache.pp
```

#### Opción 2: Módulo Completo
```bash
sudo puppet apply site.pp
```

#### Verificación
```bash
# Verificar que Apache está funcionando
sudo systemctl status apache2

# Probar la página web
curl http://localhost
# O abrir en el navegador: http://localhost
```

## 🎓 Estructura de la Clase

### Duración Total: 2-3 horas

#### Fase 1: Introducción Teórica (30-45 min)
- Conceptos de automatización e Infrastructure as Code
- Introducción a Puppet
- Demostración en vivo

#### Fase 2: Práctica Guiada (60-90 min)
- Instalación de Puppet
- Primer manifiesto
- Módulo avanzado
- Personalización y troubleshooting

#### Fase 3: Ejercicios Prácticos (30-45 min)
- Personalización individual
- Configuración de múltiples entornos
- Extensiones creativas

## 📊 Sistema de Evaluación

- **40% Evaluación formativa** (durante la clase)
- **60% Evaluación sumativa** (práctica individual + cuestionario)

### Criterios de Evaluación:
- 🧠 Comprensión conceptual
- 🔧 Habilidades técnicas
- 🐛 Resolución de problemas
- 🚀 Aplicación práctica
- 👥 Trabajo colaborativo

## 🛠️ Tecnologías Utilizadas

- **Puppet**: Herramienta de automatización de infraestructura
- **Apache HTTP Server**: Servidor web
- **Linux/Windows**: Sistemas operativos soportados
- **Git**: Control de versiones
- **Markdown**: Documentación

## 🤝 Contribuciones

Este es un proyecto educativo abierto. Las contribuciones son bienvenidas:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crea un Pull Request

## 📞 Soporte

Para dudas sobre la implementación de esta práctica:
- 📧 Crear un Issue en GitHub
- 📚 Consultar la documentación oficial de [Puppet](https://puppet.com/docs/)
- 🎮 Usar [Puppet Learning VM](https://puppet.com/try-puppet/puppet-learning-vm/)

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 🎉 Agradecimientos

- [Puppet Inc.](https://puppet.com/) por la herramienta y documentación
- Comunidad de Puppet por los recursos y soporte
- Estudiantes y docentes que han probado y mejorado este material

---

## 🚀 ¡Comienza tu Journey en DevOps!

Este proyecto te introduce al mundo de la automatización de infraestructura. Al completarlo, habrás dado el primer paso hacia una carrera en DevOps, Cloud Engineering o Systems Administration.

**¡Que tengas una excelente práctica! 🎓✨**

---

*Última actualización: Enero 2025*