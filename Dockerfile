# =====================================================
# Dockerfile para Landing Page (HTML estático)
# =====================================================

FROM nginx:alpine

# Metadata
LABEL maintainer="ClinicaVetPro Team"
LABEL description="Landing Page HTML estática"

# Copiar archivos HTML estáticos
COPY nginx/html/ /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY js/ /usr/share/nginx/html/js/

# Copiar configuración de nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Exponer puerto
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# Nginx en foreground
CMD ["nginx", "-g", "daemon off;"]
