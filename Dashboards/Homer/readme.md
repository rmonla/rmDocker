<!--  
# Ricardo MONLA (https://github.com/rmonla)
# Homer - v250114-1933
-->
# <img src="https://raw.githubusercontent.com/bastienwirtz/homer/main/public/logo.png" alt="Homer Logo" width="100"/> Homer

Este documento explica cómo configurar un contenedor Docker para implementar **Homer**, dashboard para todas sus aplicaciones web. Sin embargo, no tiene que limitarse a las aplicaciones, puede añadir enlaces a lo que quiera. No hay iframes aquí, no hay aplicaciones dentro de aplicaciones, ni abstracción de APIs. Si crees que algo debería funcionar de cierta manera.

---

## Enlaces de Consulta

- 📚 **Información del Aplicativo**:
  - [Sitio Oficial](https://github.com/bastienwirtz/homer)
  - [Documentación Oficial](https://github.com/bastienwirtz/homer)
  - [Demo dashboard | Homer](https://homer-demo.netlify.app/)
- 🎥 **Videos Recomendados**:
  - [Descubre 20 aplicaciones que puedes instalar con DOCKER... ¡te encantarán!](https://youtu.be/gqpJ7RE02Ao) - por [**Un loco y su tecnología**](https://www.youtube.com/@unlocoysutecnologia)
---

## Características Destacadas

- **Interfaz moderna:** Diseño atractivo y minimalista con gráficos en tiempo real.
- **Altamente personalizable:** Configura widgets para mostrar la información que más necesitas.
- **Compatibilidad:** Funciona en múltiples plataformas y entornos gracias a Docker.
- **Temperaturas de CPU:** Permite habilitar lecturas de temperatura para un monitoreo más detallado.
- **Configuración sencilla:** Despliegue rápido mediante contenedores Docker.

---

## Requisitos Previos

- Sistema operativo Linux y se requiere que `curl` esté instalado.
- Docker y Docker Compose instalados en el sistema.
- Espacio en disco adecuado para datos persistentes.
- Acceso a los puertos necesarios para la interfaz web y servicios relacionados.

---

## Configuración e Implementación

### 1. Ejecutar el Script de Despliegue `rmDkrUp-Homer.sh`

Ejecuta el siguiente comando en tu terminal para descargar y ejecutar el script:

```bash
curl -sSL "https://github.com/rmonla/rmDocker/raw/refs/heads/main/Dashboards/Homer/rmDkrUp-Homer.sh" | bash
```
---

## ¡Invítame un Café! ☕

Si este proyecto te ha sido útil y deseas apoyar su desarrollo, considera invitarme un café. Cada contribución ayuda a mantener el flujo de trabajo y a mejorar herramientas como esta.  

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

---

> Este documento está basado en los estándares y prácticas recomendadas para implementaciones autohospedadas con Docker. Asegúrate de realizar un monitoreo regular y mantener el sistema actualizado.
