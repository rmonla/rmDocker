#!/bin/bash
# Script para configurar y desplegar Homer en Docker
# Ricardo MONLA (https://github.com/rmonla)
# rmUPsHomepage - v250116-2116

# Variables del Docker
dkrENVs=$(cat <<YAML

dkrNOM=homepage
dkrPOR=80

archDkrENVs=.env
archDkrDCOM=docker-compose.yml

dirAppCFG=config
archAppCFG1=bookmarks.yaml
archAppCFG2=services.yaml
archAppCFG3=settings.yaml
YAML
)

dkrDCOM=$(cat <<YAML
services:
  homepage:
    image: ghcr.io/gethomepage/homepage:latest
    container_name: \${dkrNOM}
    environment:
      PUID: 1000 # optional, your user id
      PGID: 1000 # optional, your group id
    ports:
      - \${dkrPOR}:3000
    volumes:
      - ./\${dirAppCFG}:/app/config # Make sure your local config directory exists
      - /var/run/docker.sock:/var/run/docker.sock:ro # optional, for docker integrations
    restart: unless-stopped
YAML
)
appCFG1=$(cat <<YAML
---
# For configuration options and examples, please see:
# https://gethomepage.dev/configs/bookmarks

- Developer:
    - rmGithub:
        - abbr: rmGH
          href: https://github.com/rmonla

- Social:
    - Reddit:
        - abbr: RE
          href: https://reddit.com/

- Entertainment:
    - YouTube:
        - abbr: YT
          href: https://youtube.com/
YAML
)
appCFG2=$(cat <<YAML
---
# For configuration options and examples, please see:
# https://gethomepage.dev/latest/configs/services
# icons found here https://github.com/walkxcode/dashboard-icons

- rmUTN:
    - Calendario DTIC:
        icon: google-calendar.svg                      # --> https://github.com/walkxcode/dashboard-icons
        href: "https://calendar.google.com/calendar/u/0/r?cid=s4nnn9vr3vnt1llq7ir7nuu7dg@group.calendar.google.com"
        description: docker
        widget:
          type: calendar
          view: agenda
          maxEvents: 10 # optional - defaults to 10
          showTime: true # optional - show time for event happening today - defaults to false
          previousDays: 3 # optional - shows events since three days ago - defaults to 0
          integrations: # optional
            - type: ical # Show calendar events from another service
              url: https://calendar.google.com/calendar/ical/s4nnn9vr3vnt1llq7ir7nuu7dg%40group.calendar.google.com/public/basic.ics # URL with calendar events
              name: My Events # required - name for these calendar events
              color: zinc # optional - defaults to pre-defined color for the service (zinc for ical)
              params: # optional - additional params for the service
                showName: true # optional - show name before event title in event line - defaults to false
    - Monitor DTIC (rmNot):
        icon: uptime-kuma.svg 
        href: "http://rmnot:3001/status/utnlr"
        description: docker
        # widget:
        #     type: uptimekuma
        #     url: "http://rmnot:3001/dashboard/2"
        #     slug: home
    - Monitor DTIC (srv-NS8):
        icon: uptime-kuma.svg                      # --> https://github.com/walkxcode/dashboard-icons
        href: "http://172.32.0.1:3001/status/utnlr"
        description: docker
        # widget:
        #     type: uptimekuma
        #     url: "http://172.22.0.1:3001"
        #     slug: home
- rmDocker:
    - rmGhDocker:
        icon: si-github-#181717        # --> https://simpleicons.org 
        href: "https://github.com/rmonla/rmDocker"
        description: docker
    - Portainer:
        icon: portainer.svg            # --> https://github.com/walkxcode/dashboard-icons
        href: "http://localhost:9000"
        description: docker
    - AssJDM_SitioPesebre:
        icon: mdi-mother-nurse-#FFB441 # --> https://pictogrammers.com/library/mdi/
        href: "http://rmnot:32768/?key=PCVBY2024"
        description: docker
- Containers:
    - Portainer:
        icon: portainer.svg
        href: "http://localhost:9000"
        description: docker
    - Portainer:
        icon: portainer.svg
        href: "{{HOMEPAGE_VAR_PORTAINER_URL}}"
        description: docker
        widget:
            type: portainer
            url: "{{HOMEPAGE_VAR_PORTAINER_URL}}"
            env: 1
            key: "{{HOMEPAGE_VAR_PORTAINER_API_KEY}}"
- Servidores:
    - Hypervisor:
        - Proxmox:
            icon: proxmox.svg
            href: "{{HOMEPAGE_VAR_PROXMOX1_URL}}"
            description: pve1
            widget:
                type: proxmox
                url: "{{HOMEPAGE_VAR_PROXMOX1_URL}}"
                username:  "{{HOMEPAGE_VAR_PROXMOX1_USER}}"
                password:  "{{HOMEPAGE_VAR_PROXMOX1_API_KEY}}"
                node: xing-01
        - Proxmox:
            icon: proxmox.svg
            href: "{{HOMEPAGE_VAR_PROXMOX2_URL}}"
            description: pve2
            widget:
                type: proxmox
                url: "{{HOMEPAGE_VAR_PROXMOX2_URL}}"
                username:  "{{HOMEPAGE_VAR_PROXMOX2_USER}}"
                password:  "{{HOMEPAGE_VAR_PROXMOX2_API_KEY}}"
                node: xing-02
    - Network:
        - UniFi:
            icon: unifi.svg
            href: "{{HOMEPAGE_VAR_UNIFI_NETWORK_URL}}"
            description: network
            widget:
                type: unifi
                url: "{{HOMEPAGE_VAR_UNIFI_NETWORK_URL}}"
                username:  "{{HOMEPAGE_VAR_UNIFI_NETWORK_USERNAME}}"
                password:  "{{HOMEPAGE_VAR_UNIFI_NETWORK_PASSWORD}}"
        - Uptime Kuma:
            icon: uptime-kuma.svg
            href: "http://rmnot:3001"
            description: internal
            widget:
                type: uptimekuma
                url: "http://rmnot:3001"
                slug: home
YAML
)
appCFG3=$(cat <<YAML
---
# For configuration options and examples, please see:
# https://gethomepage.dev/latest/configs/settings

title: rmNot

background:
  image: https://cdnb.artstation.com/p/assets/images/images/006/897/659/large/mikael-gustafsson-wallpaper-mikael-gustafsson.jpg
  blur: sm # sm, md, xl... see https://tailwindcss.com/docs/backdrop-blur
  saturate: 100 # 0, 50, 100... see https://tailwindcss.com/docs/backdrop-saturate
  brightness: 50 # 0, 50, 75... see https://tailwindcss.com/docs/backdrop-brightness
  opacity: 100 # 0-100

theme: dark
color: slate

useEqualHeights: true

layout:
  rmUTN:
    header: true
    style: row
    columns: 3
    iconsOnly: true
  rmDocker:
    header: true
    style: row
    columns: 3
    iconsOnly: true
  Containers:
    header: true
    style: row
    columns: 4
  Servidores:
    header: true
    style: row
    columns: 2
    Hypervisor:
      header: true
      style: row
      columns: 2
    Network:
      header: true
      style: row
      columns: 2
YAML
)
# ---

# Procesar el contenido de dkrENVs y exportar las variables
eval "$(echo "$dkrENVs" | grep -E '^[a-zA-Z_][a-zA-Z0-9_]*=' | sed 's/^/export /')"
# ---

crear_directorio() {
    for newDir in "$@"; do
        echo "Creando el directorio $newDir"
        mkdir -p "$newDir" || { echo "Error al crear el directorio $newDir"; exit 1; }
    done
}

dirDKR="$(pwd)/$dkrNOM"
aDkrENVs="$dirDKR/$archDkrENVs"
aDkrDCOM="$dirDKR/$archDkrDCOM"

dAppCFG="$dirDKR/$dirAppCFG"
aAppCFG1="$dAppCFG/$archAppCFG1"
aAppCFG2="$dAppCFG/$archAppCFG2"
aAppCFG3="$dAppCFG/$archAppCFG3"

directorios=(
    "$dAppCFG"
)

crear_directorio "${directorios[@]}"
# ---

escribir_archivo() {
    echo "Creando el archivo $2"
    echo "$1" > "$2" || { echo "Error al escribir $2"; exit 1; }
}
escribir_archivo "${dkrENVs}" "$aDkrENVs" # Variables de entorno de Docker
escribir_archivo "${dkrDCOM}" "$aDkrDCOM" # Archivo de despliegue de Docker
escribir_archivo "${appCFG1}" "$aAppCFG1"
escribir_archivo "${appCFG2}" "$aAppCFG2"
escribir_archivo "${appCFG3}" "$aAppCFG3"
# ---

# Ejecutar docker-compose
echo "Iniciando el contenedor con docker-compose..."
docker compose -f "$aDkrDCOM" up -d || { echo "Error al ejecutar docker-compose"; exit 1; }

# Mensaje de finalización
echo "${dkrNOM} se ha desplegado correctamente en http://localhost:${dkrPOR}/"
