<!--  
# Ricardo Monla (https://github.com/rmonla)
# Unifi - v250116-1823
-->

# <img src="https://raw.githubusercontent.com/Brandawg93/Unifi/main/src/app/icon.svg" alt="Unifi Logo" width="100"/>Unifi

**Unifi** es un panel de control compacto diseñado para interactuar con [Network UPS Tools (NUT)](https://networkupstools.org/), una solución que permite monitorizar y gestionar Sistemas de Alimentación Ininterrumpida (SAI/UPS) y otros dispositivos de energía. Este dashboard proporciona una interfaz web sencilla y eficiente para supervisar el estado y rendimiento de los dispositivos gestionados por NUT.

---

## Características Principales

- **Interfaz Web Intuitiva**: Ofrece una visualización clara y accesible del estado de los dispositivos UPS, facilitando la monitorización en tiempo real.

- **Integración Sencilla**: Diseñado para integrarse fácilmente con instalaciones existentes de NUT, permitiendo una configuración rápida y sin complicaciones.

- **Ligero y Eficiente**: Su diseño minimalista asegura un bajo consumo de recursos, haciéndolo ideal para sistemas con capacidades limitadas.

- **Despliegue mediante Docker**: Unifi puede ser desplegado utilizando contenedores Docker, lo que simplifica su instalación y mantenimiento.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Repositorio en GitHub](https://github.com/Brandawg93/Unifi/)

---

## Implementación con Docker

El siguiente script automatiza el proceso de configuración y despliegue de **Unifi**, asegurando que los directorios, archivos de configuración y contenedores necesarios estén listos con un único comando. Esto facilita una implementación rápida y sin complicaciones.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://docs.docker.com/engine/install/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para datos persistentes.
- Configuración de puertos para la interfaz web y servicios relacionados.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **Unifi** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Monitores/Unifi/rmDkrUp-Unifi.sh" | bash

```

### Ingreso al Aplicativo

Una vez desplegado el contenedor, accede al aplicativo utilizando la siguiente URL:

- **URL**: [http://localhost:[dkrPOR]](http://localhost:[dkrPOR])

Luego en la pantalla se debe colocar las credenciales e informacion de la UPS conectada a la red. !VERIFICAR 
---


## Agradecimientos

Si este proyecto te resulta útil, considera apoyar su desarrollo:

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento sigue las mejores prácticas para implementaciones autohospedadas con Docker. Recuerda monitorear constantemente y mantener tu sistema actualizado para garantizar un rendimiento óptimo.
