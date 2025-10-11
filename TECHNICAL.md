# 📋 Documentación Técnica - VetCare Pro Landing Page

## Arquitectura del Sistema

### Stack Tecnológico
- **Frontend**: HTML5, CSS3, JavaScript ES6+
- **Framework CSS**: Tailwind CSS 2.2.19 (CDN)
- **Iconos**: Font Awesome 6.0 (CDN)
- **Servidor Web**: Nginx Alpine (Dockerizado)
- **Orquestación**: Docker Compose 3.8

### Arquitectura de Contenedores

```
┌─────────────────────────────────────┐
│   Cliente (Navegador Web)          │
│   http://localhost                  │
└──────────────┬──────────────────────┘
               │ Puerto 80
               ▼
┌─────────────────────────────────────┐
│   Docker Container                  │
│   ┌───────────────────────────┐    │
│   │   Nginx Alpine            │    │
│   │   - Servidor Web          │    │
│   │   - Archivos Estáticos    │    │
│   └───────────────────────────┘    │
│                                     │
│   Volumes montados:                 │
│   - ./nginx/nginx.conf → config    │
│   - ./nginx/html → content         │
└─────────────────────────────────────┘
```

## Estructura de Archivos

```
vetcare-landing-page/
├── .dockerignore              # Archivos excluidos en build Docker
├── .gitignore                 # Archivos excluidos de Git
├── docker-compose.yml         # Orquestación de contenedores
├── LICENSE                    # Licencia MIT
├── README.md                  # Documentación principal
├── QUICKSTART.md             # Guía rápida
├── TECHNICAL.md              # Esta documentación
└── nginx/
    ├── nginx.conf            # Configuración de Nginx
    └── html/
        ├── index.html        # Landing page principal
        ├── css/              # Estilos personalizados (futuro)
        └── assets/           # Imágenes y recursos (futuro)
```

## Configuración de Nginx

### Características Implementadas

1. **Servidor HTTP en puerto 80**
   - Escucha en todas las interfaces
   - Server name: localhost

2. **Root Directory**
   - `/usr/share/nginx/html`
   - Index: `index.html`

3. **Logging**
   - Access logs: `/var/log/nginx/access.log`
   - Error logs: `/var/log/nginx/error.log`

4. **Rutas Configuradas**
   - `/` - Sirve la landing page
   - `/app` - Redirección temporal (302) a aplicación futura
   - Archivos estáticos cacheados por 1 año

5. **Optimizaciones**
   - Sendfile activado
   - Keepalive timeout: 65s
   - Cache-Control headers para assets
   - Logs deshabilitados para favicon y robots.txt

## Landing Page - Componentes

### Secciones HTML

1. **Navigation Bar** (Fijo)
   - Logo con icono de pata
   - Menú desktop: Características, Servicios, Precios, Contacto
   - Botón CTA: "Iniciar Sesión" → /app
   - Menú hamburguesa para móvil

2. **Hero Section**
   - Título principal con gradiente
   - Subtítulo descriptivo
   - 2 CTAs: "Comenzar Ahora" y "Conocer Más"
   - Imagen SVG placeholder del dashboard

3. **Features Section** (6 tarjetas)
   - Gestión de Citas
   - Historiales Clínicos
   - Facturación Digital
   - Gestión de Clientes
   - Reportes y Analytics
   - App Móvil

4. **Services Section** (4 módulos)
   - Módulo Médico
   - Módulo Farmacia
   - Módulo Caja
   - Módulo Reportes

5. **Pricing Section** (3 planes)
   - Básico: $49/mes
   - Profesional: $99/mes (destacado)
   - Enterprise: $199/mes

6. **CTA Section**
   - Llamado a la acción secundario
   - 2 botones: "Comenzar Gratis" y "Contactar Ventas"

7. **Footer** (4 columnas)
   - Información de la empresa
   - Enlaces rápidos
   - Datos de contacto
   - Enlaces legales

### Interactividad JavaScript

```javascript
// Scroll suave entre secciones
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', smoothScroll);
});

// Navbar con fondo dinámico al hacer scroll
window.addEventListener('scroll', navbarBackground);
```

## Estilos y Diseño

### Paleta de Colores

| Color              | Hex Code  | Uso                          |
|--------------------|-----------|------------------------------|
| Verde Primario     | #2E8B57   | Botones, headers, iconos     |
| Verde Secundario   | #3CB371   | Gradientes, hover states     |
| Amarillo Acento    | #FCD34D   | CTAs destacados              |
| Gris Oscuro        | #1F2937   | Texto principal              |
| Gris Medio         | #6B7280   | Texto secundario             |
| Gris Claro         | #F9FAFB   | Fondos alternos              |

### Tipografía

- **Font Family**: System sans-serif (Arial, Helvetica)
- **Títulos H1**: 4xl-6xl (36px-60px)
- **Títulos H2**: 3xl-4xl (30px-36px)
- **Títulos H3**: xl (20px)
- **Texto**: base-xl (16px-20px)

### Responsive Breakpoints (Tailwind)

```css
sm:  640px  // Tablets pequeñas
md:  768px  // Tablets
lg:  1024px // Desktop pequeño
xl:  1280px // Desktop grande
```

## Docker Compose - Configuración

### Servicio: vetcare-landing

```yaml
image: nginx:alpine           # Imagen ligera (5MB)
container_name: vetcare-landing-page
ports: 80:80                  # HTTP estándar
volumes:                      # Montaje de archivos
  - nginx.conf (read-only)
  - html/ (read-only)
restart: unless-stopped       # Auto-restart
networks: vetcare-network     # Red aislada
```

### Comandos Docker

| Comando | Acción |
|---------|--------|
| `docker-compose up -d` | Iniciar servicio |
| `docker-compose down` | Detener servicio |
| `docker-compose ps` | Ver estado |
| `docker-compose logs -f` | Ver logs en vivo |
| `docker-compose restart` | Reiniciar |
| `docker-compose up -d --force-recreate` | Recrear contenedor |

## Performance y Optimización

### Optimizaciones Implementadas

1. **Nginx Alpine**: Imagen de solo 5MB vs 133MB de nginx:latest
2. **CDN para librerías**: Tailwind y Font Awesome desde CDN
3. **Cache headers**: Assets estáticos cacheados 1 año
4. **Sendfile**: Transferencia eficiente de archivos
5. **SVG inline**: Placeholder de imagen como data URI
6. **Minificación**: CDNs entregan versiones minificadas

### Métricas Esperadas

- **Tiempo de carga**: < 2 segundos
- **Tamaño total**: < 500KB (inicial)
- **Requests HTTP**: ~5 (HTML + 2 CDNs + favicon + assets)
- **Lighthouse Score**: > 90/100

## Seguridad

### Implementaciones

1. ✅ Contenedor con permisos mínimos
2. ✅ Volumes en modo read-only
3. ✅ Red Docker aislada
4. ✅ No expone puertos innecesarios
5. ✅ Nginx actualizado (Alpine edge)

### Recomendaciones Futuras

- [ ] Implementar HTTPS con Let's Encrypt
- [ ] Agregar headers de seguridad (CSP, HSTS)
- [ ] Rate limiting en Nginx
- [ ] Firewall de aplicación web (WAF)

## Integración Futura

### Conectar con Backend

Modificar `nginx/nginx.conf`:

```nginx
location /app {
    proxy_pass http://vetcare-backend:8080;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

Agregar servicio en `docker-compose.yml`:

```yaml
services:
  vetcare-backend:
    build: ./backend
    ports:
      - "8080:8080"
    networks:
      - vetcare-network
    depends_on:
      - postgres
```

## Mantenimiento

### Actualizar Contenido

1. Editar `nginx/html/index.html`
2. Guardar cambios
3. Ejecutar: `docker-compose restart`

### Actualizar Nginx

```bash
docker-compose pull
docker-compose up -d --force-recreate
```

### Backup

```bash
# Backup de archivos
tar -czf vetcare-landing-backup.tar.gz nginx/

# Restaurar
tar -xzf vetcare-landing-backup.tar.gz
```

## Troubleshooting

### Problema: Puerto 80 ocupado

**Solución en Windows**:
```cmd
net stop http
```

O cambiar puerto en docker-compose.yml:
```yaml
ports:
  - "8080:80"
```

### Problema: Contenedor no inicia

**Diagnóstico**:
```bash
docker-compose logs vetcare-landing
docker inspect vetcare-landing-page
```

**Soluciones**:
1. Verificar sintaxis de nginx.conf
2. Verificar que existe index.html
3. Revisar permisos de archivos

### Problema: Cambios no se reflejan

**Solución**:
```bash
docker-compose down
docker-compose up -d --force-recreate
# Limpiar cache del navegador (Ctrl+F5)
```

## Testing

### Pruebas Manuales

- [ ] Landing page carga en http://localhost
- [ ] Todas las secciones son visibles
- [ ] Links de navegación funcionan (scroll suave)
- [ ] Botones "Iniciar Sesión" redirigen
- [ ] Responsive en móvil (DevTools)
- [ ] Iconos de Font Awesome cargan
- [ ] Estilos de Tailwind aplican correctamente

### Pruebas de Contenedor

```bash
# Verificar que Nginx está corriendo
docker exec vetcare-landing-page nginx -t

# Verificar archivos montados
docker exec vetcare-landing-page ls -la /usr/share/nginx/html

# Verificar configuración
docker exec vetcare-landing-page cat /etc/nginx/nginx.conf
```

## Licencia

MIT License - Ver archivo LICENSE para detalles completos.

## Contacto Técnico

Para soporte técnico o consultas sobre el despliegue:
- Email: info@vetcarepro.com
- Documentación: README.md

---

**Última actualización**: 2025-10-11
**Versión**: 1.0.0
**Estado**: Producción (Local)

