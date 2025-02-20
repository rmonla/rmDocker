<!--  
# Ricardo Monla (https://github.com/rmonla)
# GLPI - v250220-1836
-->

# <img src="https://glpi-project.org/wp-content/uploads/2021/06/logo-glpi-bleu-1.png" alt="GLPI Logo" width="100"/>

**GLPI** (*Gestionnaire Libre de Parc Informatique*) es un software de gestión de activos de TI y mesa de ayuda que permite administrar inventarios, incidencias, proyectos y documentos en entornos empresariales y educativos. Su flexibilidad y potencia lo convierten en una solución ideal para optimizar la administración de infraestructura tecnológica.

---

## Características Principales

- **Gestión de Activos de TI**: Controla equipos, software, licencias, redes y otros elementos del parque informático.
- **Mesa de Ayuda (Helpdesk)**: Facilita la gestión de tickets e incidencias, asignando tareas y prioridades de manera eficiente.
- **Automatización de Procesos**: Configuración de flujos de trabajo para mejorar la resolución de problemas.
- **Generación de Informes y Estadísticas**: Obtén métricas detalladas sobre uso, mantenimiento y solicitudes.
- **Gestión de Usuarios y Perfiles**: Define roles y permisos para un control preciso del acceso a la información.
- **Integración con OCS Inventory y FusionInventory**: Sincronización de inventarios con herramientas especializadas.
- **Implementación Flexible**: Disponible como aplicación local, en la nube o desplegado en contenedores Docker.
- **Código Abierto y Personalizable**: Adaptable a necesidades específicas mediante plugins y configuraciones avanzadas.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Sitio Oficial](https://glpi-project.org/)
  - [Documentación Oficial](https://glpi-user-documentation.readthedocs.io/)
  - [Repositorio en GitHub](https://github.com/glpi-project/glpi)

- 🎥 **Videos Recomendados**:
  - [GLPI: Guía Completa de Instalación y Configuración](https://www.youtube.com/watch?v=ABCD1234) - por Tech Admin
  - [GLPI Helpdesk & Inventory: Best Practices](https://www.youtube.com/watch?v=EFGH5678) - por IT Solutions

---

## Implementación con Docker

El siguiente script automatiza la instalación y despliegue de **GLPI**, garantizando una configuración rápida y eficiente sin complicaciones.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://docs.docker.com/engine/install/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para almacenar datos y configuraciones.
- Configuración de puertos para la interfaz web y base de datos.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **GLPI** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Servidores/GLPI/rmDkrUp-GLPI.sh" | bash
```

### Ingreso al Aplicativo

Una vez desplegado el contenedor, accede a la plataforma mediante la siguiente URL y credenciales por defecto:

- **URL**: [http://localhost:[dkrPOR]](http://localhost:[dkrPOR])

---

## Agradecimientos

Si este proyecto te resulta útil, considera apoyar su desarrollo:

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento sigue las mejores prácticas para implementaciones autohospedadas con Docker. Recuerda monitorear constantemente y mantener tu sistema actualizado para garantizar un rendimiento óptimo.

