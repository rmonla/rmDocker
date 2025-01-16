<!--  
# Ricardo Monla (https://github.com/rmonla)
# Portainer - v250116-0329
-->

# <img src="https://www.portainer.io/hubfs/portainer-logo-white-1.svg" alt="Portainer Logo" width="300"/>

**Portainer** es una herramienta completa y moderna para la gestión de entornos Docker y Kubernetes. Diseñada para simplificar la administración de contenedores, aplicaciones y redes, Portainer es ideal tanto para entornos domésticos como empresariales. Su interfaz gráfica intuitiva y personalizable permite a los usuarios centralizar operaciones y mejorar la eficiencia, reduciendo la complejidad técnica asociada con la gestión de contenedores.

---

## Características Principales

- **Gestión de Contenedores Simplificada**: Proporciona una interfaz gráfica para crear, implementar y administrar contenedores, redes y volúmenes de manera eficiente.

- **Compatibilidad con Docker y Kubernetes**: Ofrece soporte para entornos basados en Docker, Docker Swarm y Kubernetes, proporcionando una experiencia unificada de administración.

- **Interfaz Gráfica Intuitiva**: Diseñada para usuarios de todos los niveles, Portainer presenta un diseño claro y opciones configurables según las necesidades.

- **Control de Acceso Avanzado**: Implementa funciones de control de acceso basadas en roles (RBAC) para gestionar permisos de usuarios y equipos en proyectos específicos.

- **Monitoreo en Tiempo Real**: Ofrece vistas detalladas del estado de los contenedores, estadísticas de recursos, y la capacidad de realizar diagnósticos y análisis de rendimiento.

- **Despliegue Rápido de Aplicaciones**: Permite el despliegue de aplicaciones mediante plantillas predefinidas, simplificando la configuración y puesta en marcha.

- **Integración con Herramientas Externas**: Compatible con registros de imágenes (Docker Hub, GitLab, etc.), orquestadores y servicios en la nube.

- **Soporte Multiplataforma**: Disponible para ser ejecutado en diversos sistemas operativos y plataformas de contenedores.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Sitio Oficial](https://nicolargo.github.io/Portainer/)
  - [Documentación](https://github.com/nicolargo/Portainer/wiki/)
  - [Repositorio GitHub](https://github.com/nicolargo/Portainer/)
- 🎥 **Videos Recomendados**:
  - [Monitoreo con Portainer en Linux - Tu htop con esteroides](https://youtu.be/oia6WqcOipU?si=Q5zA9J_Y4egr7KdD) - por [**Manuel Cabrera Caballero**](https://www.youtube.com/@DriveMeca)

---

## Implementación con Docker

El siguiente script automatiza el proceso de configuración y despliegue de **Portainer**, asegurando que los directorios, archivos de configuración y contenedores necesarios estén listos con un único comando. Esto facilita una implementación rápida y sin complicaciones.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://docs.docker.com/engine/install/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para datos persistentes.
- Configuración de puertos para la interfaz web y servicios relacionados.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **Portainer** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Monitores/Portainer/rmDkrUp-Portainer.sh" | bash

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
