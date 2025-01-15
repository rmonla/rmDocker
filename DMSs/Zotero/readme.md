<!--  
# Ricardo Monla (https://github.com/rmonla)
# Zotero - v250115-1521
-->

# <img src="https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/zotero-icon.png" alt="Zotero Logo" width="100"/>

**Zotero** es una herramienta gratuita y de código abierto diseñada para ayudar en la recopilación, organización, anotación, citación y compartición de investigaciones.

---

## Recursos y Enlaces Útiles

- 📚 **Información del Software**:
  - [Sitio Oficial](https://www.zotero.org/)
  - [Documentación Oficial](https://www.zotero.org/support/)
  - [Documentación Docker](https://hub.docker.com/r/linuxserver/zotero/)
  - [Repositorio en GitHub](https://github.com/linuxserver/docker-zotero)
---

## Principales Características

- **Recopilación Automática de Referencias**: Zotero detecta automáticamente contenido académico mientras navegas por la web, permitiendo guardar artículos, libros y otros recursos con un solo clic. 

- **Organización Personalizada**: Facilita la clasificación de investigaciones mediante colecciones y etiquetas, y permite realizar búsquedas avanzadas para acceder rápidamente a los materiales necesarios. 

- **Generación de Citas y Bibliografías**: Crea referencias y bibliografías instantáneamente en diversos procesadores de texto, incluyendo Microsoft Word, LibreOffice y Google Docs, con soporte para más de 9,000 estilos de citación. 

- **Sincronización entre Dispositivos**: Ofrece la opción de sincronizar datos a través de múltiples dispositivos, manteniendo archivos, notas y registros bibliográficos actualizados y accesibles desde cualquier navegador web. 

- **Colaboración en Grupo**: Permite compartir bibliotecas con otros usuarios, facilitando la coautoría de trabajos, distribución de materiales académicos y creación de bibliografías colaborativas sin costo adicional. 

- **Integración con Navegadores**: Funciona con conectores para navegadores como Chrome, Firefox, Safari y Opera, detectando automáticamente el contenido y permitiendo su almacenamiento en Zotero con un solo clic. 

- **Soporte Multiplataforma**: Compatible con sistemas operativos como Mac, Windows y Linux, lo que garantiza su accesibilidad para una amplia gama de usuarios. 

- **Almacenamiento y Gestión de Archivos**: Permite almacenar y gestionar referencias, etiquetas, notas y archivos adjuntos, facilitando la organización de la información recopilada. 

- **Extracción Automática de Metadatos**: Ofrece la capacidad de extraer automáticamente metadatos de documentos PDF, simplificando el proceso de incorporación de nuevas referencias. 

- **Búsqueda de Texto Completo**: Incluye una función de búsqueda completa de texto a través de documentos, lo que facilita la localización de información específica dentro de los archivos almacenados.

---

## Implementación con Docker

El siguiente script automatiza el proceso de configuración y despliegue de **Zotero**, asegurando que los directorios, archivos de configuración y contenedores necesarios estén listos con un único comando. Esto facilita una implementación rápida y sin complicaciones.

### Requisitos Previos

- Sistema operativo **Linux** con [Curl](https://curl.se/) instalado.
- Instalaciones previas de [Docker](https://www.docker.com/) y [Docker Compose](https://docs.docker.com/compose/).
- Espacio en disco suficiente para datos persistentes.
- Configuración de puertos para la interfaz web y servicios relacionados.

### Despliegue del Contenedor

Ejecuta el siguiente comando en la terminal para desplegar **Zotero** con Docker:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/DMSs/Zotero/rmDkrUp-Zotero.sh" | bash
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
