# 🤝 Guía de Contribución

¡Gracias por tu interés en contribuir a VetCare Pro Landing Page!

## 📋 Código de Conducta

Este proyecto busca ser un espacio acogedor y respetuoso para todos. Se espera que los contribuidores:

- Usen un lenguaje acogedor e inclusivo
- Respeten los diferentes puntos de vista
- Acepten críticas constructivas
- Se enfoquen en lo mejor para la comunidad

## 🚀 ¿Cómo Contribuir?

### 1. Reportar Bugs

Si encuentras un bug, abre un issue incluyendo:

- Descripción clara del problema
- Pasos para reproducir
- Comportamiento esperado vs actual
- Capturas de pantalla (si aplica)
- Versión de Docker y sistema operativo

### 2. Sugerir Mejoras

Para sugerencias de nuevas características:

- Describe la funcionalidad deseada
- Explica el caso de uso
- Proporciona ejemplos si es posible

### 3. Contribuir con Código

#### Paso 1: Fork del Repositorio
```bash
# Clonar tu fork
git clone https://github.com/tu-usuario/vetcare-landing-page.git
cd vetcare-landing-page
```

#### Paso 2: Crear una Rama
```bash
git checkout -b feature/mi-nueva-caracteristica
# o
git checkout -b fix/correccion-bug
```

#### Paso 3: Hacer Cambios
- Edita los archivos necesarios
- Mantén el código limpio y documentado
- Sigue las convenciones existentes

#### Paso 4: Probar Localmente
```bash
docker-compose up -d
# Verificar en http://localhost
docker-compose down
```

#### Paso 5: Commit y Push
```bash
git add .
git commit -m "feat: descripción clara del cambio"
git push origin feature/mi-nueva-caracteristica
```

#### Paso 6: Pull Request
- Crea un PR desde tu rama hacia `main`
- Describe los cambios realizados
- Referencia issues relacionados

## 📝 Convenciones de Código

### HTML
- Usar indentación de 4 espacios
- Elementos semánticos cuando sea posible
- Comentarios para secciones principales

### CSS
- Usar clases de Tailwind cuando sea posible
- Mantener estilos custom en la etiqueta `<style>`
- Nombres descriptivos en inglés

### JavaScript
- Usar ES6+ cuando sea posible
- Comentarios para funciones complejas
- Variables con nombres descriptivos

### Docker
- Mantener configuraciones simples
- Comentar configuraciones no obvias
- Usar versiones específicas de imágenes

## 📌 Convenciones de Commits

Seguimos [Conventional Commits](https://www.conventionalcommits.org/):

```
tipo(alcance): descripción corta

[descripción larga opcional]

[footer opcional]
```

### Tipos de Commit
- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `docs`: Cambios en documentación
- `style`: Cambios de formato (no afectan lógica)
- `refactor`: Refactorización de código
- `test`: Agregar o modificar tests
- `chore`: Tareas de mantenimiento

### Ejemplos
```bash
feat(hero): agregar video de fondo animado
fix(navbar): corregir menú móvil que no cierra
docs(readme): actualizar instrucciones de instalación
style(footer): mejorar espaciado en sección legal
refactor(css): migrar estilos inline a archivo externo
```

## 🔍 Checklist de Pull Request

Antes de enviar tu PR, verifica:

- [ ] El código funciona localmente
- [ ] No hay errores en la consola del navegador
- [ ] El diseño es responsive (móvil y desktop)
- [ ] Los cambios están documentados
- [ ] El commit message sigue las convenciones
- [ ] Se actualizó CHANGELOG.md si aplica
- [ ] No hay conflictos con la rama main

## 🎨 Guía de Estilos

### Colores
Usar la paleta definida:
- Verde: `#2E8B57`, `#3CB371`
- Amarillo: `#FCD34D`
- Grises: Escala de Tailwind

### Iconos
- Usar Font Awesome 6.0
- Preferir iconos solid sobre regular
- Tamaño coherente con el contexto

### Tipografía
- Mantener jerarquía visual
- Usar clases de Tailwind para tamaños
- Evitar más de 3 tamaños en una sección

## 🧪 Testing

### Testing Manual
```bash
# Iniciar contenedor
docker-compose up -d

# Verificar en navegador
# - http://localhost
# - DevTools > Responsive Design Mode
# - Probar todos los enlaces
# - Verificar scroll suave

# Ver logs
docker-compose logs -f

# Detener
docker-compose down
```

### Validación HTML
Usar [W3C Validator](https://validator.w3.org/)

### Performance
Usar [Lighthouse](https://developers.google.com/web/tools/lighthouse) en Chrome DevTools

## 📚 Recursos Útiles

- [Tailwind CSS Docs](https://tailwindcss.com/docs)
- [Font Awesome Icons](https://fontawesome.com/icons)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [Docker Compose Reference](https://docs.docker.com/compose/)

## ❓ ¿Necesitas Ayuda?

Si tienes dudas:
- Revisa la documentación en README.md
- Consulta TECHNICAL.md para detalles técnicos
- Abre un issue con la etiqueta `question`

## 📄 Licencia

Al contribuir, aceptas que tus contribuciones serán licenciadas bajo la MIT License del proyecto.

---

¡Gracias por contribuir a VetCare Pro! 🐾

