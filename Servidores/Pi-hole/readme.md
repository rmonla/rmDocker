<!--  
# Ricardo Monla (https://github.com/rmonla)
# Pi-hole - v250117-2315
-->

# <img src="https://pi-hole.github.io/graphics/Vortex/Vortex_with_Wordmark.svg" alt="Pi-hole Logo" width="100"/>

**Pi-hole** es un bloqueador de publicidad a nivel de red que actúa como un servidor DNS, filtrando anuncios y rastreadores antes de que lleguen a los dispositivos de una red. Es una solución eficiente para mejorar la privacidad, acelerar la navegación y reducir el consumo de ancho de banda al bloquear anuncios en todas las aplicaciones y dispositivos conectados.

---

## Características Principales

- **Bloqueo de Publicidad a Nivel de Red**: Filtra anuncios en toda la red sin necesidad de instalar software en cada dispositivo.
- **Protección contra Seguimiento y Malware**: Bloquea rastreadores y dominios maliciosos mediante listas de bloqueo actualizables.
- **Interfaz Web de Administración**: Permite gestionar reglas de bloqueo, revisar estadísticas de tráfico y configurar excepciones.
- **Compatible con Cualquier Dispositivo**: Funciona con ordenadores, teléfonos, tablets, Smart TVs y cualquier equipo conectado a la red.
- **Funciona como Servidor DNS Local**: Puede configurarse para gestionar el tráfico DNS, mejorando la privacidad y el rendimiento.
- **Soporte para Listas de Bloqueo Personalizadas**: Permite añadir listas específicas para adaptar el filtrado a las necesidades del usuario.
- **Ligero y Eficiente**: Se puede ejecutar en dispositivos de bajo consumo, como una Raspberry Pi, servidores Linux o incluso en contenedores Docker.
- **Modo de Funcionamiento sin Conexión a Internet**: Sigue funcionando incluso si la conexión a Internet se interrumpe, proporcionando resolución de nombres local.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Sitio Oficial](https://pi-hole.net/)
  - [Documentación Oficial](https://docs.pi-hole.net/)
  - [Repositorio en GitHub](https://github.com/pi-hole/pi-hole)

- 🎥 **Videos Recomendados**:
  - [World's Greatest Pi-hole Tutorial - Easy Raspberry Pi Project!](https://www.youtube.com/watch?v=cE21YjuaB6o) - por Crosstalk Solutions
  - [Pi-hole Made EASY - A Complete Tutorial](https://www.youtube.com/watch?v=e_EfmKdP2ng) - por Tech Craft

---

## Implementación con Docker

El siguiente script automatiza el proceso de configuración y despliegue de **Pi-hole**, asegurando que los directorios, archivos de configuración y contenedores necesarios estén listos con un único comando. Esto facilita una implementación rápida y sin complicaciones.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://docs.docker.com/engine/install/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para datos persistentes.
- Configuración de puertos para la interfaz web y servicios relacionados.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **Pi-hole** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Servidores/Pi-hole/rmDkrUp-Pi-hole.sh" | bash

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
