<!--  
# Ricardo Monla (https://github.com/rmonla)
# Glances - v250116-0310
-->

# <img src="https://nicolargo.github.io/glances/public/images/glances.png" alt="Glances Logo" width="100"/>

**Glances** es una herramienta avanzada para la monitorización en tiempo real de sistemas, aplicaciones y redes. Diseñada para ser eficiente y altamente configurable, Glances se adapta tanto a usuarios individuales como a administradores de sistemas.

---

## Características Destacadas

- **Monitorización en Tiempo Real**: Proporciona información detallada sobre el rendimiento del sistema, como el uso de CPU, memoria, discos, red, procesos y más, todo en tiempo real.

- **Interfaz Personalizable**: Ofrece una interfaz moderna y adaptable que permite ajustar los parámetros visualizados según las necesidades del usuario.

- **Modo Cliente/Servidor**: Glances puede ejecutarse en un servidor y permitir la monitorización remota desde cualquier dispositivo conectado.

- **Integración con Herramientas Externas**: Compatible con plataformas como InfluxDB, Elasticsearch, y Grafana para análisis de datos avanzados y generación de informes visuales.

- **Soporte para Contenedores**: Incluye funcionalidades específicas para monitorizar sistemas que utilicen Docker o tecnologías similares.

- **Alertas Personalizadas**: Permite configurar alertas basadas en condiciones específicas del sistema, ayudando a identificar problemas potenciales antes de que se conviertan en críticos.

- **Multiplataforma**: Funciona en sistemas operativos basados en Linux, macOS, Windows y BSD.

- **Fácil Instalación y Uso**: Disponible como paquete Python, imagen Docker o binario precompilado, lo que facilita su implementación en diferentes entornos.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Sitio Oficial](https://nicolargo.github.io/glances/)
  - [Documentación](https://github.com/nicolargo/glances/wiki/)
  - [Repositorio GitHub](https://github.com/nicolargo/glances/)
- 🎥 **Videos Recomendados**:
  - [Monitoreo con Glances en Linux - Tu htop con esteroides](https://youtu.be/oia6WqcOipU?si=Q5zA9J_Y4egr7KdD) - por [**Manuel Cabrera Caballero**](https://www.youtube.com/@DriveMeca)

---

## Implementación con Docker

El siguiente script automatiza el proceso de configuración y despliegue de **Glances**, asegurando que los directorios, archivos de configuración y contenedores necesarios estén listos con un único comando. Esto facilita una implementación rápida y sin complicaciones.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://docs.docker.com/engine/install/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para datos persistentes.
- Configuración de puertos para la interfaz web y servicios relacionados.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **Glances** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Monitores/Glances/rmDkrUp-Glances.sh" | bash

```

### Ingreso al Aplicativo

Una vez desplegado el contenedor, accede al aplicativo utilizando la siguiente URL y credenciales por defecto:

- **URL**: [http://localhost:dkrPOR=61208](http://localhost:dkrPOR=61208)
---

## Agradecimientos

Si este proyecto te resulta útil, considera apoyar su desarrollo:

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento sigue las mejores prácticas para implementaciones autohospedadas con Docker. Recuerda monitorear constantemente y mantener tu sistema actualizado para garantizar un rendimiento óptimo.
