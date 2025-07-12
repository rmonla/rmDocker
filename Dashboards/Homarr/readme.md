<!--  
# Ricardo MONLA (https://github.com/rmonla)
# Homarr - v250712-1623
-->
# <img src="https://homarr.dev/img/logo.png" alt="Homarr Logo" width="100"/> Homarr

Este documento explica cómo configurar un contenedor Docker para implementar **Homarr**, una solución moderna y eficiente diseñada para centralizar la gestión de servicios en redes domésticas o empresariales. Homearr optimiza la experiencia del usuario al proporcionar un dashboard intuitivo para acceder y organizar diversas aplicaciones y servicios.

---

## Enlaces de Consulta

- 📚 **Información del Aplicativo**:
  - [Sitio Oficial](https://homarr.dev)
  - [Repositorio en GitHub](https://github.com/ajnart/homarr)
  - [Documentación Oficial](https://homarr.dev)
- 🎥 **Videos Recomendados**:
  - [my FAVORITE Home Server Dashboard - Homarr Setup in Docker](https://youtu.be/A6vcTIzp_Ww) - por [**TechHut**](https://www.youtube.com/@TechHut)

---

## Características Destacadas

- **Interfaz unificada:** Consolida múltiples servicios en un solo panel accesible y organizado.
- **Compatibilidad extensa:** Compatible con populares aplicaciones de gestión como Sonarr, Radarr, Plex, y más.
- **Automatización eficiente:** Configura flujos de trabajo automatizados para simplificar tareas repetitivas.
- **Alta personalización:** Ofrece widgets y herramientas ajustables según las necesidades del usuario.
- **Seguridad robusta:** Controles de acceso avanzados y cifrado para proteger la información.
- **Multiplataforma:** Disponible para Linux, macOS, Windows y en entornos Docker.

---

## Requisitos Previos

- **Sistema operativo:** Linux Debian (se requiere que `curl` esté instalado).
- Docker y Docker Compose instalados en el sistema.
- Espacio en disco adecuado para datos persistentes.
- Acceso a los puertos necesarios para la interfaz web y servicios relacionados.

---

## Configuración e Implementación

### 1. Ejecutar el Script de Despliegue `rmDkrUp-Homarr.sh`

Ejecuta el siguiente comando en tu terminal para descargar y ejecutar el script:

```bash
curl -sS https://raw.githubusercontent.com/rmonla/rmDocker/main/rmDkrUPs/rmDKrUPs.rb | sudo ruby - Dashboards/Homarr rm-homarr
```
---

## ¡Invítame un Café! ☕

Si este proyecto te ha sido útil y deseas apoyar su desarrollo, considera invitarme un café. Cada contribución ayuda a mantener el flujo de trabajo y a mejorar herramientas como esta.  

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento está basado en los estándares y prácticas recomendadas para implementaciones autohospedadas con Docker. Asegúrate de realizar un monitoreo regular y mantener el sistema actualizado.
