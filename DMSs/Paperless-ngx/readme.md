<!--  
# Ricardo MONLA (https://github.com/rmonla)
# Paperless-ngx - v250114-2244
-->
# <img src="https://raw.githubusercontent.com/paperless-ngx/paperless-ngx/main/resources/logo/web/png/White%20logo%20-%20no%20background.png" alt="Paperless-ngx Logo" width="300"/>

Este documento explica cómo configurar un contenedor Docker para implementar **Paperless-ngx**, un sistema de gestión de documentos de código abierto diseñado para digitalizar, organizar y buscar documentos de forma eficiente. Permite a los usuarios escanear, almacenar y gestionar documentos electrónicos, proporcionando características como la indexación automática, el reconocimiento óptico de caracteres (OCR) y un sistema de búsqueda avanzado. Es ideal para individuos y organizaciones que buscan una solución accesible y personalizable para gestionar sus archivos digitales de manera ordenada y segura.

---

## Enlaces de Consulta

- 📚 **Información del Aplicativo**:
  - [Sitio Oficial](https://github.com/paperless-ngx/paperless-ngx)
  - [Documentación Oficial](https://docs.paperless-ngx.com)
  - [Documentación Docker](https://github.com/linuxserver/docker-paperless-ngx)
- 🎥 **Videos Recomendados**:
  - [Video Paperless-ngx](https://youtu.be/***gqpJ7RE02Ao***) - por [**Paperless-ngx**](https://www.youtube.com/@***unlocoysutecnologia***)
---

## Características Destacadas

- **Digitalización eficiente:** Permite escanear documentos físicos y convertirlos en archivos digitales con OCR.
- **Indexación automática:** Organiza y clasifica documentos para una búsqueda rápida y precisa.
- **Interfaz moderna:** Diseño atractivo y minimalista con gráficos en tiempo real.
- **Altamente personalizable:** Configura widgets para mostrar la información que más necesitas.
- **Compatibilidad:** Funciona en múltiples plataformas y entornos gracias a Docker.
- **Seguridad:** Gestor de usuarios y roles para garantizar acceso seguro a los documentos.
- **Integraciones:** Compatible con servicios de almacenamiento en la nube y aplicaciones externas.
- **Configuración sencilla:** Despliegue rápido mediante contenedores Docker.
- **Actualizaciones regulares:** Comunidad activa que mejora continuamente el software.
- **Múltiples formatos soportados:** Permite trabajar con documentos en formatos PDF, JPEG, PNG, TIFF y más.

---

## Requisitos Previos

- Sistema operativo Linux y se requiere que [`curl`](https://curl.se/) esté instalado.
- [Docker](https://www.docker.com/) y [Docker Compose](https://docs.linuxserver.io/general/docker-compose) instalados en el sistema.
- Espacio en disco adecuado para datos persistentes.
- Acceso a los puertos necesarios para la interfaz web y servicios relacionados.
---

## Configuración e Implementación

### 1. Ejecutar el Script de Despliegue `rmDkrUp-Paperless-ngx.sh`

Ejecuta el siguiente comando en tu terminal para descargar y ejecutar el script:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/DMSs/Paperless-ngx/rmDkrUp-Paperless-ngx.sh" | bash
```
---

## ¡Invítame un Café! ☕

Si este proyecto te ha sido útil y deseas apoyar su desarrollo, considera invitarme un café. Cada contribución ayuda a mantener el flujo de trabajo y a mejorar herramientas como esta.  

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento está basado en los estándares y prácticas recomendadas para implementaciones autohospedadas con Docker. Asegúrate de realizar un monitoreo regular y mantener el sistema actualizado.
