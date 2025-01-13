<!--  
# Ricardo MONLA (https://github.com/rmonla)
# Dashy - v250113-0745
-->
# <img src="https://dashy.to/img/dashy.png" alt="Dashy Logo" width="100"/> Dashy

Este documento explica cómo configurar un contenedor Docker para implementar **Dashy**, una herramienta autohospedada diseñada para la monitorización de sitios y servicios en tiempo real. Con un diseño moderno, intuitivo y altamente personalizable, Dashy permite a los usuarios supervisar la disponibilidad y el rendimiento de sus recursos críticos.

---

## Enlaces de Consulta

- 📚 **Información del Aplicativo**:
  - [Sitio Oficial](https://dashy.to/)
  - [Repositorio en GitHub](https://github.com/Lissy93/dashy)
  - [Documentación Oficial](https://dashy.to/docs/)
- 🎥 **Videos Recomendados**:
  - [Dashy 1.0 - Release](https://youtu.be/AWAlOQeNpgU) - por **Louis**

---

## Características Destacadas

- **Monitorización avanzada:** Supervisa el estado y el rendimiento de múltiples servicios.
- **Diseño intuitivo:** Interfaz clara y moderna que mejora la experiencia del usuario.
- **Implementación sencilla:** Configuración rápida utilizando Docker Compose.
- **Solución autohospedada:** Mantén el control total sobre los datos y las configuraciones.
- **Compatibilidad:** Ideal para integrarse con otras herramientas como Uptime Kuma, Portainer, y más.

---

## Requisitos Previos

- Sistema operativo Linux y se requiere que `curl` esté instalado.
- Docker y Docker Compose instalados en el sistema.
- Espacio en disco adecuado para datos persistentes.
- Acceso a los puertos necesarios para la interfaz web y servicios relacionados.

---

## Configuración e Implementación

### 1. Ejecutar el Script de Despliegue `rmDkrUp-Dashy.sh`

Ejecuta el siguiente comando en tu terminal para descargar y ejecutar el script:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Dashboards/Dashy/rmDkrUp-Dashy.sh" | bash
```

---

## ¡Invítame un Café! ☕

Si este proyecto te ha sido útil y deseas apoyar su desarrollo, considera invitarme un café. Cada contribución ayuda a mantener el flujo de trabajo y a mejorar herramientas como esta.  

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento está basado en los estándares y prácticas recomendadas para implementaciones autohospedadas con Docker. Asegúrate de realizar un monitoreo regular y mantener el sistema actualizado.