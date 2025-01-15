<!--  
# Ricardo Monla (https://github.com/rmonla)
# Teedy - v250115-1218
-->

# <img src="https://teedy.io/img/github-title.png" alt="Teedy Logo" width="300"/>

**Teedy** es un sistema de gestión de documentos (Document Management System, DMS) de código abierto. Está diseñado para digitalizar, organizar y gestionar documentos de forma eficiente. Es una solución ideal para pequeñas y medianas empresas, así como para usuarios que buscan una herramienta ligera y económica de gestión documental.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Sitio Oficial](https://teedy.io)
  - [Documentación Oficial](https://teedy.io/docs)
  - [Demo Online](https://demo.teedy.io/)
  - [Repositorio en GitHub](https://github.com/sismics/docs)

- 🎥 **Videos Recomendados**:
  - [Introducción a Teedy](https://youtu.be/gqpJ7RE02Ao) - por [Un Loco y Su Tecnología](https://www.youtube.com/@unlocoysutecnologia)

---

## Principales Características

1. **Gestión Eficiente de Documentos**: Permite almacenar, organizar y recuperar documentos con facilidad.
2. **Búsqueda Avanzada**: Incluye un sistema de etiquetado y búsqueda por palabras clave.
3. **Control de Versiones**: Ofrece un historial completo de cambios y versiones.
4. **Acceso Multiusuario**: Configuración avanzada de permisos para diferentes usuarios.
5. **Interfaz Intuitiva**: Navegación sencilla para una rápida adopción.
6. **Integración API**: Conexión con otros sistemas y flujos de trabajo.
7. **Compatibilidad**: Admite formatos como PDF, Word, Excel e imágenes.
8. **OCR Incorporado**: Reconocimiento óptico de texto en documentos escaneados.
9. **Notificaciones**: Alertas automáticas para cambios y actividades.
10. **Seguridad**: Protección avanzada y copias de seguridad automáticas.

---

## Implementación con Docker

El siguiente script automatiza el proceso de configuración y despliegue de **Teedy**, asegurando que los directorios, archivos de configuración y contenedores necesarios estén listos con un único comando. Esto facilita una implementación rápida y sin complicaciones.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://www.docker.com/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para datos persistentes.
- Configuración de puertos para la interfaz web y servicios relacionados.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **Teedy** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/DMSs/Teedy/rmDkrUp-Teedy.sh" | bash
```

### Ingreso al Aplicativo

Una vez desplegado el contenedor, accede al aplicativo utilizando la siguiente URL y credenciales por defecto:

- **URL**: [http://localhost:8080](http://localhost:8080)
- **Usuario**: `admin`  
- **Contraseña**: `admin`

---

## Agradecimientos

Si este proyecto te resulta útil, considera apoyar su desarrollo:

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento sigue las mejores prácticas para implementaciones autohospedadas con Docker. Recuerda monitorear constantemente y mantener tu sistema actualizado para garantizar un rendimiento óptimo.
