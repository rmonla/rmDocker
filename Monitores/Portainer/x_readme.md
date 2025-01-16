<!--  
# Ricardo MONLA (https://github.com/rmonla)
# Portainer|readme.md - v250110-2220
-->
# <img src="https://www.portainer.io/hubfs/portainer-logo-white-1.svg" alt="Portainer Logo" width="50%"/>

Este documento describe cómo configurar e implementar **Portainer** utilizando contenedores Docker. Portainer es una solución moderna y potente para la gestión de entornos Docker y Kubernetes, diseñada para simplificar la administración de contenedores, aplicaciones y redes, tanto en configuraciones domésticas como empresariales. Con una interfaz gráfica intuitiva y personalizable, Portainer centraliza las operaciones, aumentando la eficiencia y reduciendo la complejidad técnica.

---

## Enlaces de Consulta

- 📚 **Información del Aplicativo**:
  - [Sitio Oficial](https://www.portainer.io)
  - [Repositorio en GitHub](https://github.com/portainer/portainer)
  - [Documentación Oficial](https://docs.portainer.io)
- 🎥 **Videos Recomendados**:
  - [NUEVA interfaz WEB para tus contenedores! - PORTAINER! / V2M](https://youtu.be/TSot5AnS-mk) - por [**Pelado Nerd**](https://www.youtube.com/@PeladoNerd)

---

## Características Destacadas

- **Gestión Centralizada:** Consolida todas las operaciones relacionadas con Docker y Kubernetes en una única plataforma, permitiendo el control completo de contenedores, redes y volúmenes.
- **Interfaz Moderna e Intuitiva:** Optimizada para navegadores y dispositivos móviles, con soporte para temas claros y oscuros.
- **Despliegue Rápido:** Instalación simplificada utilizando Docker Compose, con soporte multiplataforma en Linux, macOS y Windows.
- **Seguridad Avanzada:** Soporte para control de acceso basado en roles, autenticación multiusuario y auditorías.
- **Soporte para Kubernetes:** Permite gestionar clústeres de Kubernetes de manera eficiente junto con entornos Docker.
- **Integración con Stacks:** Posibilidad de desplegar aplicaciones en stacks mediante plantillas personalizadas.
- **Escalabilidad y Monitoreo:** Ideal para gestionar desde implementaciones locales hasta infraestructuras empresariales en la nube.

---

## Requisitos Previos

- **Sistema operativo:** Linux Debian (se requiere que `curl` esté instalado).
- Docker y Docker Compose instalados en el sistema.
- Espacio en disco adecuado para datos persistentes.
- Acceso a los puertos necesarios para la interfaz web y servicios relacionados.

---

## Configuración e Implementación

### 1. Ejecutar el Script de Despliegue `rmDkrUp-Portainer.sh`

Ejecuta el siguiente comando en tu terminal para descargar y ejecutar el script:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Monitores/Portainer/rmDkrUp-Portainer.sh" | bash
```

---


## ¡Invítame un Café! ☕

Si este proyecto te ha sido útil y deseas apoyar su desarrollo, considera invitarme un café. Cada contribución ayuda a mantener el flujo de trabajo y a mejorar herramientas como esta.  

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento está basado en los estándares y prácticas recomendadas para implementaciones autohospedadas con Docker. Asegúrate de realizar un monitoreo regular y mantener el sistema actualizado.
