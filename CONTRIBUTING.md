# 🤝 Guía de Contribución

¡Gracias por tu interés en contribuir a este proyecto educativo de automatización con Puppet!

## 🎯 Tipos de Contribuciones

### 📚 **Mejoras Educativas**
- Correcciones en las guías de docentes y estudiantes
- Nuevos ejercicios prácticos
- Mejoras en las presentaciones
- Actualizaciones de contenido técnico

### 🔧 **Mejoras Técnicas**
- Optimización de manifiestos de Puppet
- Nuevos módulos y funcionalidades
- Mejoras en scripts de instalación
- Corrección de bugs

### 📖 **Documentación**
- Mejoras en README
- Nuevos ejemplos de uso
- Traducciones a otros idiomas
- Guías de troubleshooting

## 🚀 Proceso de Contribución

### 1. **Fork del Repositorio**
```bash
# Haz fork del repositorio en GitHub
# Luego clona tu fork localmente
git clone https://github.com/TU_USUARIO/automatizacion.git
cd automatizacion
```

### 2. **Crear una Rama**
```bash
# Crea una rama para tu contribución
git checkout -b feature/nombre-de-tu-contribucion
```

### 3. **Hacer Cambios**
- Realiza tus modificaciones
- Asegúrate de que el código funcione correctamente
- Actualiza la documentación si es necesario
- Prueba los cambios en diferentes sistemas operativos

### 4. **Commit y Push**
```bash
# Agrega tus cambios
git add .

# Haz commit con un mensaje descriptivo
git commit -m "✨ Agregar nueva funcionalidad X"

# Sube tus cambios
git push origin feature/nombre-de-tu-contribucion
```

### 5. **Crear Pull Request**
- Ve a GitHub y crea un Pull Request
- Describe claramente qué cambios hiciste y por qué
- Incluye capturas de pantalla si es relevante
- Menciona si hay breaking changes

## 📋 Estándares de Código

### **Manifiestos de Puppet**
- Usa indentación de 2 espacios
- Nombres de recursos en minúsculas
- Comentarios claros y descriptivos
- Sigue las mejores prácticas de Puppet

### **Documentación**
- Usa Markdown estándar
- Incluye emojis para mejor legibilidad
- Mantén un tono educativo y amigable
- Actualiza el índice si agregas nuevas secciones

### **Scripts**
- Incluye comentarios explicativos
- Maneja errores apropiadamente
- Usa variables para valores configurables
- Prueba en múltiples sistemas operativos

## 🧪 Testing

### **Antes de Enviar tu PR:**
- [ ] Prueba la instalación en Linux (Ubuntu/Debian)
- [ ] Prueba la instalación en Windows
- [ ] Verifica que los manifiestos funcionen correctamente
- [ ] Comprueba que la documentación se vea bien
- [ ] Asegúrate de que no hay errores de sintaxis

### **Comandos de Prueba:**
```bash
# Probar manifiesto simple
sudo puppet apply apache.pp --noop

# Probar módulo completo
sudo puppet apply site.pp --noop

# Verificar sintaxis
puppet parser validate *.pp
```

## 📝 Plantilla de Pull Request

```markdown
## 📋 Descripción
Describe brevemente qué cambios hiciste y por qué.

## 🔧 Tipo de Cambio
- [ ] Bug fix
- [ ] Nueva funcionalidad
- [ ] Mejora en documentación
- [ ] Mejora educativa
- [ ] Otro (especificar)

## 🧪 Testing
- [ ] Probé en Linux
- [ ] Probé en Windows
- [ ] Verifiqué la documentación
- [ ] No hay breaking changes

## 📸 Screenshots
Si es relevante, incluye capturas de pantalla.

## ✅ Checklist
- [ ] Mi código sigue los estándares del proyecto
- [ ] Actualicé la documentación
- [ ] Agregué tests si es necesario
- [ ] Todos los tests pasan
```

## 🐛 Reportar Bugs

### **Usa el Template de Issues:**
```markdown
## 🐛 Descripción del Bug
Descripción clara y concisa del bug.

## 🔄 Pasos para Reproducir
1. Ve a '...'
2. Haz clic en '....'
3. Scroll down to '....'
4. Ve el error

## ✅ Comportamiento Esperado
Qué esperabas que pasara.

## 📸 Screenshots
Si es aplicable, agrega screenshots.

## 💻 Información del Sistema
- OS: [e.g. Ubuntu 20.04, Windows 10]
- Puppet version: [e.g. 7.0.0]
- Browser: [e.g. chrome, safari]

## 📋 Contexto Adicional
Cualquier otra información relevante.
```

## 💡 Sugerir Mejoras

### **Template para Feature Requests:**
```markdown
## 💡 Descripción de la Mejora
Descripción clara de la mejora que te gustaría ver.

## 🎯 Problema que Resuelve
¿Qué problema resuelve esta mejora?

## 💭 Solución Propuesta
Describe la solución que propones.

## 🔄 Alternativas Consideradas
Describe alternativas que consideraste.

## 📋 Contexto Adicional
Cualquier otra información, screenshots, etc.
```

## 🏆 Reconocimientos

### **Tipos de Contribuidores:**
- 🥇 **Core Contributors**: Contribuidores regulares
- 🥈 **Documentation Heroes**: Mejoras en documentación
- 🥉 **Bug Hunters**: Encuentran y reportan bugs
- 🌟 **Feature Creators**: Crean nuevas funcionalidades

### **Reconocimiento Público:**
- Los contribuidores serán mencionados en el README
- Se creará una sección de "Agradecimientos"
- Se destacarán contribuciones especiales

## 📞 Contacto

Si tienes preguntas sobre cómo contribuir:
- 📧 Abre un Issue en GitHub
- 💬 Únete a las discusiones del proyecto
- 📚 Consulta la documentación existente

## 📄 Licencia

Al contribuir, aceptas que tus contribuciones serán licenciadas bajo la Licencia MIT del proyecto.

---

**¡Gracias por hacer este proyecto mejor para todos! 🚀**
