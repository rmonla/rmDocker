#!/bin/bash
# Script para configurar y desplegar Homer en Docker
# Ricardo MONLA (https://github.com/rmonla)
# rmUPsHomer - v250116-2017

# Variables del Docker
dkrENVs=$(cat <<YAML

dkrNOM=homer
dkrPOR=7080

archDkrENVs=.env
archDkrDCOM=docker-compose.yml

dirAppCFG=config
archAppCFG=config.yml
YAML
)

dkrDCOM=$(cat <<YAML
services:
  homer:
    image: b4bz/homer
    container_name: \${dkrNOM}
    volumes:
      - ./\${dirAppCFG}:/www/assets # Make sure your local config directory exists
    ports:
      - \${dkrPOR}:8080
    user: 1000:1000 # default
    environment:
      - INIT_ASSETS=1 # default, requires the config directory to be writable for the container user (see user option)
    restart: unless-stopped
YAML
)
appCFG=$(cat <<YAML
---
# Homepage configuration
# See https://fontawesome.com/search for icons options

title: "rmDash"
subtitle: "rmNot"
logo: "logo.png"
# icon: "fas fa-skull-crossbones" # Optional icon

header: true
footer: '<p>Created with <span class="has-text-danger">❤️</span> with <a href="https://bulma.io/">bulma</a>, <a href="https://vuejs.org/">vuejs</a> & <a href="https://fontawesome.com/">font awesome</a> // Fork me on <a href="https://github.com/bastienwirtz/homer"><i class="fab fa-github-alt"></i></a></p>' # set false if you want to hide it.

# Optional theme customization
theme: default

# Optional theme customization (color overrrides)
# overrrides can also be done using CSS vars 
colors:
  light:
    highlight-primary: "#3367d6"
    highlight-secondary: "#4285f4"
    highlight-hover: "#5a95f5"
    background: "#f5f5f5"
    card-background: "#ffffff"
    text: "#363636"
    text-header: "#ffffff"
    text-title: "#303030"
    text-subtitle: "#424242"
    card-shadow: rgba(0, 0, 0, 0.1)
    link: "#3273dc"
    link-hover: "#363636"
  dark:
    highlight-primary: "#3367d6"
    highlight-secondary: "#4285f4"
    highlight-hover: "#5a95f5"
    background: "#131313"
    card-background: "#2b2b2b"
    text: "#eaeaea"
    text-header: "#ffffff"
    text-title: "#fafafa"
    text-subtitle: "#f5f5f5"
    card-shadow: rgba(0, 0, 0, 0.4)
    link: "#3273dc"
    link-hover: "#ffdd57"

# Optional message
message:
  #url: https://b4bz.io
  style: "is-dark" # See https://bulma.io/documentation/components/message/#colors for styling options.
  title: "Demo !"
  icon: "fa fa-grin"
  content: "This is a dummy homepage demo. <br /> Find more information on <a href='https://github.com/bastienwirtz/homer'>github.com/bastienwirtz/homer</a>"

# Optional navbar
# links: [] # Allows for navbar (dark mode, layout, and search) without any links
links:
  - name: "Contribute"
    icon: "fab fa-github"
    url: "https://github.com/bastienwirtz/homer"
    target: "_blank" # optional html a tag target attribute
  - name: "Wiki"
    icon: "fas fa-book"
    url: "https://www.wikipedia.org/"
  # this will link to a second homer page that will load config from additional-page.yml and keep default config values as in config.yml file
  # see url field and assets/additional-page.yml.dist used in this example:
  #- name: "another page!"
  #  icon: "fas fa-file-alt"
  #  url: "#additional-page" 

# Services
# First level array represent a group.
# Leave only a "items" key if not using group (group name, icon & tagstyle are optional, section separation will not be displayed).
services:
  - name: "Applications"
    icon: "fas fa-cloud"
    items:
      - name: "Uptime Kuma"
        icon: "fas fa-download"
        # logo: "assets/tools/sample.png"
        # subtitle: "A fancy self-hosted monitoring tool" # optional, if no subtitle is defined, Uptime Kuma incidents, if any, will be shown
        url: "http://rmnot:3001"
        slug: "utnlr" # Defaults to "default" if not provided.
        type: "UptimeKuma"      
      
      - name: "Get started"
        icon: "fa-solid fa-download"
        subtitle: "Start using Homer in a few minutes"
        tag: "setup"
        url: "https://github.com/bastienwirtz/homer?tab=readme-ov-file#getting-started"
      - name: "Configuration"
        icon: "fa-solid fa-sliders"
        subtitle: "Configuration options documentation"
        tag: "setup"
        url: "https://github.com/bastienwirtz/homer/blob/main/docs/configuration.md"
      - name: "Theming"
        icon: "fa-solid fa-palette"
        subtitle: "Customize Homer appearance"
        tag: "theming"
        url: "https://github.com/bastienwirtz/homer/blob/main/docs/theming.md"
      - name: "Smart cards"
        icon: "fa-solid fa-palette"
        subtitle: "Displays dynamic information or actions."
        tag: "setup"
        url: "https://github.com/bastienwirtz/homer/blob/main/docs/theming.md"
      - name: "Dashboard icons"
        icon: "fa-solid fa-icons"
        subtitle: "Dashboard icons"
        tag: "setup"
        url: "https://github.com/walkxcode/dashboard-icons"

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

dirAppCFG="$dirDKR/$dirAppCFG"
aAppCFG="$dirAppCFG/$archAppCFG"

directorios=(
    "$dirAppCFG"
)

crear_directorio "${directorios[@]}"
# ---

escribir_archivo() {
    echo "Creando el archivo $2"
    echo "$1" > "$2" || { echo "Error al escribir $2"; exit 1; }
}
escribir_archivo "${dkrENVs}" "$aDkrENVs"  # Variables de entorno de Docker
escribir_archivo "${dkrDCOM}" "$aDkrDCOM" # Archivo de despliegue de Docker
escribir_archivo "${appCFG}" "$aAppCFG"  # Archivo de despliegue de Docker
# ---

# Ejecutar docker-compose
echo "Iniciando el contenedor con docker-compose..."
docker compose -f "$aDkrDCOM" up -d || { echo "Error al ejecutar docker-compose"; exit 1; }

# Mensaje de finalización
echo "${dkrNOM} se ha desplegado correctamente en http://localhost:${dkrPOR}/"
