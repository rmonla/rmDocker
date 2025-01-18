<!--  
# Ricardo Monla (https://github.com/rmonla)
# Jellyfin - v250118-1121
-->

# <img src="https://jellyfin.org/images/logo.svg" alt="Jellyfin Logo" width="100"/>

**Jellyfin** es un servidor multimedia de código abierto que permite gestionar y transmitir contenido a múltiples dispositivos sin depender de servicios en la nube. Es una alternativa a Plex y Emby, proporcionando control total sobre la biblioteca de medios sin restricciones de pago ni recopilación de datos.

---

## Características Principales

- **Streaming de Contenido Multimedia**: Permite ver películas, series, música y fotos en múltiples dispositivos.
- **Transcodificación en Tiempo Real**: Optimiza la reproducción de contenido en función del dispositivo.
- **Multiusuario y Control Parental**: Permite crear perfiles con permisos personalizados.
- **Integración con Clientes Variados**: Compatible con Smart TVs, Chromecast, Kodi, dispositivos móviles y más.
- **Biblioteca Organizada Automáticamente**: Descarga metadatos, carátulas y subtítulos de forma automática.
- **Soporte para Plugins y Personalización**: Amplía funcionalidades mediante complementos y temas.
- **Sin Restricciones de Pago ni Publicidad**: 100% gratuito y sin recopilación de datos.
- **Funciona en Diversas Plataformas**: Puede ejecutarse en Windows, Linux, macOS, NAS y contenedores Docker.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Sitio Oficial](https://jellyfin.org/)
  - [Documentación Oficial](https://jellyfin.org/docs/)
  - [Repositorio en GitHub](https://github.com/jellyfin/jellyfin)

- 🎥 **Videos Recomendados**:
  - [Cómo INSTALAR JELLYFIN con DOCKER COMPOSE Guía Completa para Tu Servidor Multimedia](https://youtu.be/TJAsFXvuXMg) - por Sir Gamba


---

## Implementación con Docker

El siguiente script automatiza la configuración y despliegue de **Jellyfin**, asegurando que los volúmenes de datos y configuraciones estén listos para su ejecución.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://docs.docker.com/engine/install/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para bibliotecas multimedia.
- Configuración de puertos para acceso remoto.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **Jellyfin** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Servidores/Jellyfin/rmDkrUp-Jellyfin.sh" | bash
```

### Ingreso al Aplicativo

Una vez desplegado el contenedor, accede al aplicativo utilizando la siguiente URL y credenciales por defecto:

- **URL**: [http://localhost:[dkrPOR]](http://localhost:[dkrPOR])

---

## Agradecimientos

Si este proyecto te resulta útil, considera apoyar su desarrollo:

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento sigue las mejores prácticas para implementaciones autohospedadas con Docker. Recuerda monitorear constantemente y mantener tu sistema actualizado para garantizar un rendimiento óptimo.

