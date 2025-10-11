# VetCare Pro - Landing Page

## 📋 Descripción del Proyecto

Landing page estática para **VetCare Pro**, sistema de gestión integral para clínicas veterinarias. Este proyecto forma parte de la evidencia **GA10-220501097-AA3-EV01** - Software instalado en plataforma del cliente.

## 🎯 Objetivo

Demostrar capacidad de despliegue de software en plataforma local utilizando tecnologías modernas de contenedores (Docker + Nginx).

## 🛠️ Stack Tecnológico

- **Frontend**: HTML5, CSS3, JavaScript Vanilla
- **Framework CSS**: Tailwind CSS (via CDN)
- **Iconos**: Font Awesome 6.0
- **Servidor Web**: Nginx Alpine
- **Contenedores**: Docker + Docker Compose
- **Plataforma**: Windows con Docker Desktop

## 📁 Estructura del Proyecto

```
vetcare-landing-page/
├── docker-compose.yml          # Configuración de contenedores
├── README.md                   # Este archivo
└── nginx/
    ├── nginx.conf              # Configuración de Nginx
    └── html/
        ├── index.html          # Landing page principal
        ├── css/                # Estilos adicionales (opcional)
        └── assets/             # Recursos multimedia (opcional)
```

## ✨ Características de la Landing Page

### Secciones Implementadas

1. **Hero Section** - Value proposition con CTA principal
2. **Características** - 6 features principales del sistema
3. **Servicios** - 4 módulos especializados
4. **Precios** - 3 planes de suscripción
5. **CTA Section** - Llamado a la acción secundario
6. **Footer** - Información de contacto y enlaces legales

### Características Técnicas

- ✅ Diseño responsive (mobile-first)
- ✅ Navegación suave entre secciones
- ✅ Efectos hover en tarjetas
- ✅ Navbar fijo con transparencia dinámica
- ✅ Iconografía veterinaria (Font Awesome)
- ✅ Colores temáticos (#2E8B57, #3CB371)
- ✅ Enlaces a aplicación principal (/app)

## 🚀 Instrucciones de Despliegue

### Prerrequisitos

1. **Docker Desktop** instalado y ejecutándose
   - Descargar desde: https://www.docker.com/products/docker-desktop

2. **Verificar instalación**:
   ```bash
   docker --version
   docker-compose --version
   ```

### Paso 1: Clonar/Ubicar el Proyecto

Navega al directorio del proyecto:

```bash
cd D:\CopiaF\AnalisisYDesarrolloDeSoftware\Proyectos\windsfur\ClinicaVetPro\ClinicaVetPro\vetcare-landing-page
```

### Paso 2: Iniciar el Contenedor

```bash
docker-compose up -d
```

**Explicación del comando**:
- `up`: Crea e inicia los contenedores
- `-d`: Modo detached (segundo plano)

### Paso 3: Verificar el Despliegue

1. **Verificar que el contenedor está corriendo**:
   ```bash
   docker-compose ps
   ```

2. **Ver logs (opcional)**:
   ```bash
   docker-compose logs -f
   ```

3. **Acceder a la landing page**:
   - Abrir navegador en: **http://localhost**

### Paso 4: Detener el Servicio

Cuando necesites detener el contenedor:

```bash
docker-compose down
```

## 🔧 Comandos Útiles

### Ver contenedores activos
```bash
docker ps
```

### Reiniciar el servicio
```bash
docker-compose restart
```

### Ver logs en tiempo real
```bash
docker-compose logs -f vetcare-landing
```

### Reconstruir después de cambios
```bash
docker-compose up -d --force-recreate
```

### Eliminar todo (contenedores, red, volúmenes)
```bash
docker-compose down -v
```

## 📸 Capturas para Evidencia

### Para el informe, incluir:

1. **Captura de `docker-compose ps`** mostrando el contenedor activo
2. **Captura del navegador** en http://localhost mostrando la landing page
3. **Captura de las diferentes secciones**:
   - Hero section
   - Características
   - Módulos
   - Precios
   - Footer
4. **Captura responsive** (F12 > Toggle device toolbar > Modo móvil)

## 🎨 Personalización

### Modificar Contenido

Editar el archivo: `nginx/html/index.html`

Después de cambios:
```bash
docker-compose restart
```

### Cambiar Puerto

En `docker-compose.yml`, cambiar:
```yaml
ports:
  - "8080:80"  # Ahora acceder en http://localhost:8080
```

### Agregar Estilos Personalizados

Crear archivo: `nginx/html/css/custom.css`

Agregar en `<head>` del index.html:
```html
<link href="css/custom.css" rel="stylesheet">
```

## 🔗 Integración con Aplicación Principal

El enlace `/app` está configurado para redirigir temporalmente a la landing page. 

**Para conectar con la aplicación real**:

Modificar en `nginx/nginx.conf`:
```nginx
location /app {
    proxy_pass http://vetcare-app:8080;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}
```

Y agregar el servicio en `docker-compose.yml`:
```yaml
services:
  vetcare-app:
    image: tu-aplicacion:latest
    ports:
      - "8080:8080"
```

## 📚 Tecnologías y Recursos

### CDN Utilizados

- **Tailwind CSS**: https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css
- **Font Awesome**: https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css

### Paleta de Colores

- Verde Primario: `#2E8B57` (SeaGreen)
- Verde Secundario: `#3CB371` (MediumSeaGreen)
- Amarillo Acento: `#FCD34D` (Tailwind Yellow-300)
- Gris Oscuro: `#1F2937` (Tailwind Gray-800)
- Gris Claro: `#F9FAFB` (Tailwind Gray-50)

## 📝 Notas para la Evidencia Académica

### Competencia Demostrada

- ✅ Instalación de software en plataforma cliente (Docker Desktop)
- ✅ Configuración de servidor web (Nginx)
- ✅ Gestión de contenedores (Docker Compose)
- ✅ Despliegue local de aplicación web
- ✅ Conocimiento de arquitectura cliente-servidor
- ✅ Documentación técnica completa

### Explicación Técnica

**¿Por qué Docker en vez de LAMP/WAMP?**

- Portabilidad entre sistemas operativos
- Aislamiento de dependencias
- Facilidad de despliegue y escalabilidad
- Práctica estándar en la industria actual
- No requiere instalación de XAMPP/WAMP

**Arquitectura del Despliegue**:

```
[Navegador] → http://localhost:80
     ↓
[Docker Container: Nginx Alpine]
     ↓
[Volume Mount: ./nginx/html]
     ↓
[index.html + Assets]
```

## 🆘 Solución de Problemas

### Error: Puerto 80 ocupado

```bash
# Windows: Detener IIS o aplicación que use puerto 80
net stop http

# O cambiar puerto en docker-compose.yml a 8080:80
```

### Error: Docker no está corriendo

1. Abrir **Docker Desktop**
2. Esperar a que el ícono de Docker en la bandeja esté verde
3. Reintentar `docker-compose up -d`

### La página no carga

1. Verificar contenedor activo: `docker ps`
2. Ver logs de errores: `docker-compose logs`
3. Verificar que `index.html` existe en `nginx/html/`

### Cambios no se reflejan

```bash
# Forzar recreación del contenedor
docker-compose down
docker-compose up -d --force-recreate
```

## 📞 Información del Proyecto

- **Nombre**: VetCare Pro - Sistema de Gestión Veterinaria
- **Tipo**: Landing Page Estática
- **Evidencia**: GA10-220501097-AA3-EV01
- **Actividad**: Elaborar plan de instalación con despliegue local
- **Fecha**: 2025
- **Ubicación**: Bogotá, Colombia

## 📄 Licencia

Este proyecto es con fines académicos y educativos.

---

**✅ Landing Page lista para despliegue y evaluación**

Para cualquier duda sobre el despliegue, consultar este README o los logs del contenedor.

