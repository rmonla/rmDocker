<!--  
# Ricardo Monla (https://github.com/rmonla)
# Unifi - v250127-0023
-->

# <img src="./logo.png" alt="Unifi Logo" width="100"/>

**Unifi** es un ecosistema de redes gestionadas de forma centralizada desarrollado por Ubiquiti, que proporciona soluciones para redes inalámbricas, switches, routers y cámaras de seguridad. Su plataforma permite la administración unificada de dispositivos, ideal para entornos empresariales y de alta demanda.

---

## Características Principales

- **Gestión Centralizada**: Control total de múltiples dispositivos de red desde una única interfaz.
- **Conectividad de Alto Rendimiento**: Soporte para Wi-Fi 6 y tecnologías avanzadas de optimización de red.
- **Escalabilidad Empresarial**: Solución adaptable para hogares, oficinas y grandes corporaciones.
- **Integración con SDN**: Gestión eficiente mediante Software Defined Networking.
- **Soporte para VLANs y Seguridad Avanzada**: Configuración detallada de políticas de acceso y segmentación de red.
- **Monitoreo en Tiempo Real**: Visualización de tráfico, dispositivos conectados y alertas de seguridad.
- **Compatibilidad Multiplataforma**: Funciona en servidores locales, en la nube y en dispositivos móviles.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Sitio Oficial](https://ui.com/unifi/)
  - [Documentación Oficial](https://help.ui.com/hc/en-us/categories/200320424-UniFi-Network)
  - [Repositorio en GitHub](https://github.com/Art-of-WiFi/UniFi-API-browser)

- 🎥 **Videos Recomendados**:
  - [How to Set Up a UniFi Network](https://www.youtube.com/watch?v=Wi-DhdGz6KY) - por Crosstalk Solutions
  - [UniFi Network Controller Complete Setup](https://www.youtube.com/watch?v=bDhI-WqK-Jk) - por Willie Howe

---

## Implementación con Docker

El siguiente script automatiza la configuración y despliegue de **Unifi Controller**, permitiendo una administración eficiente de dispositivos de red.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://docs.docker.com/engine/install/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para almacenamiento de configuraciones y logs.
- Configuración de puertos adecuada para acceso remoto.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **Unifi Controller** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Monitores/Unifi/rmDkrUp-Unifi.sh" | bash
```

### Ingreso al Aplicativo

Una vez desplegado el contenedor, accede al aplicativo utilizando la siguiente URL y continua con el asistete de configuracion inicial:

- **URL**: [http://localhost:8080](http://localhost:8080)

---

## Agradecimientos

Si este proyecto te resulta útil, considera apoyar su desarrollo:

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento sigue las mejores prácticas para implementaciones autohospedadas con Docker. Recuerda monitorear constantemente y mantener tu sistema actualizado para garantizar un rendimiento óptimo.

