<!--  
# Ricardo Monla (https://github.com/rmonla)
# Dockge - v250115-1956
-->

# <img src="https://github.com/louislam/uptime-kuma/raw/master/public/icon.png" alt="Dockge Logo" width="100"/>Dockge

**Dockge** es una herramienta de código abierto diseñada para facilitar la gestión de aplicaciones Docker mediante archivos `docker-compose.yaml`. Su objetivo principal es proporcionar una interfaz intuitiva y reactiva para administrar pilas de contenedores de manera eficiente.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Sitio Oficial](https://dockge.kuma.pet/)
  - [Documentación Docker](https://hub.docker.com/r/louislam/dockge/)
  - [Repositorio en GitHub](https://github.com/louislam/dockge/)
- 🎥 **Videos Recomendados**:
  - [Dockge 1.0 - Release](https://youtu.be/AWAlOQeNpgU&t=48s) - por [**Louis**](https://www.youtube.com/@LouisLamLam)
---

## Principales Características

- **Gestión de Pilas de Contenedores**: Permite crear, editar, iniciar, detener, reiniciar y eliminar pilas de contenedores definidas en archivos `compose.yaml`.

- **Actualización de Imágenes Docker**: Facilita la actualización de imágenes Docker utilizadas en las pilas, asegurando que las aplicaciones se mantengan al día.

- **Interfaz de Usuario Intuitiva**: Ofrece una interfaz web fácil de usar, diseñada para mejorar la experiencia del usuario en la gestión de contenedores.

- **Integración con Docker Compose V2**: Construido sobre Docker Compose V2, aprovecha las mejoras y funcionalidades avanzadas de esta versión.

- **Soporte para Directorios Personalizados**: Permite configurar directorios personalizados para almacenar los archivos `compose.yaml`, brindando flexibilidad en la organización de las pilas.

- **Compatibilidad con Portainer**: Aunque Dockge se centra en la gestión de pilas mediante `compose.yaml`, es posible utilizarlo junto con Portainer para una administración más completa de los contenedores.

- **Código Abierto y Comunidad Activa**: Al ser una herramienta de código abierto, cuenta con una comunidad activa que contribuye a su desarrollo y mejora continua.

---

## Implementación con Docker

El siguiente script automatiza el proceso de configuración y despliegue de **Dockge**, asegurando que los directorios, archivos de configuración y contenedores necesarios estén listos con un único comando. Esto facilita una implementación rápida y sin complicaciones.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://docs.docker.com/engine/install/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para datos persistentes.
- Configuración de puertos para la interfaz web y servicios relacionados.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **Dockge** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Monitores/Dockge/rmDkrUp-Dockge.sh" | bash

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
