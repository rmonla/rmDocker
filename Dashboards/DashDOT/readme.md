<!--  
# Ricardo MONLA (https://github.com/rmonla)
# DashDOT - v250112-2142
-->
# <img src="https://getdashdot.com/img/logo512.png" alt="DashDOT Logo" width="100"/> dash.

Este documento explica cómo configurar un contenedor Docker para implementar **Dashdot**, panel de control moderno y altamente personalizable diseñado para monitorear el estado de tu servidor. Proporciona información clara y visualmente atractiva sobre recursos como CPU, RAM, almacenamiento y red, todo en tiempo real. Ideal para quienes buscan una solución sencilla y efectiva para supervisar su infraestructura.

---

## Enlaces de Consulta

- 📚 **Información del Aplicativo**:
  - [Sitio Oficial](https://getdashdot.com)
  - [Repositorio en GitHub](https://github.com/MauriceNino/dashdot)
  - [Documentación Oficial](https://getdashdot.com/docs/installation)
- 🎥 **Videos Recomendados**:
  - [Cómo instalar Dash usando Docker compose](https://youtu.be/vHxt3kpNEXg) - por [**José Maria Labarta**](https://www.youtube.com/@josemarialabarta)

---

## Características Destacadas

- **Interfaz moderna:** Diseño atractivo y minimalista con gráficos en tiempo real.
- **Altamente personalizable:** Configura widgets para mostrar la información que más necesitas.
- **Compatibilidad:** Funciona en múltiples plataformas y entornos gracias a Docker.
- **Temperaturas de CPU:** Permite habilitar lecturas de temperatura para un monitoreo más detallado.
- **Configuración sencilla:** Despliegue rápido mediante contenedores Docker.

---

## Requisitos Previos

- **Sistema operativo:** Linux Debian (se requiere que `curl` esté instalado).
- Docker y Docker Compose instalados en el sistema.
- Espacio en disco adecuado para datos persistentes.
- Acceso a los puertos necesarios para la interfaz web y servicios relacionados.

---

## Configuración e Implementación

### 1. Ejecutar el Script de Despliegue `rmDkrUp-DashDOT.sh`

Ejecuta el siguiente comando en tu terminal para descargar y ejecutar el script:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Dashboards/DashDOT/rmDkrUp-DashDOT.sh" | bash
```

---



## ¡Invítame un Café! ☕

Si este proyecto te ha sido útil y deseas apoyar su desarrollo, considera invitarme un café. Cada contribución ayuda a mantener el flujo de trabajo y a mejorar herramientas como esta.  

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento está basado en los estándares y prácticas recomendadas para implementaciones autohospedadas con Docker. Asegúrate de realizar un monitoreo regular y mantener el sistema actualizado.
