#!/bin/bash
# Script para configurar y desplegar Dockge en Docker
# Ricardo MONLA (https://github.com/rmonla)
# Dockge - v250115-1823

# Variables del Docker
dkrVRS=$(cat <<YAML

dkrNOM=dockge
dkrPOR=5001

dkrArchENV=.env
dkrArchYML=docker-compose.yml

appDirDAT=data
YAML
)

dkrYML=$(cat <<YAML
services:
  dockge:
    image: louislam/dockge:1
    container_name: \${dkrNOM}
    restart: unless-stopped
    ports:
      - \${dkrPOR}:5001
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./\${appDirDAT}:/app/data
      - /opt/stacks:/opt/stacks
    environment:
      - DOCKGE_STACKS_DIR=/opt/stacks

YAML
)
# ---

# Procesar el contenido de dkrVRS y exportar las variables
eval "$(echo "$dkrVRS" | grep -E '^[a-zA-Z_][a-zA-Z0-9_]*=' | sed 's/^/export /')"
# ---

crear_directorio() {
    for newDir in "$@"; do
        echo "Creando el directorio $newDir"
        mkdir -p "$newDir" || { echo "Error al crear el directorio $newDir"; exit 1; }
    done
}

dirDKR="$(pwd)/$dkrNOM"

directorios=(
    "$dirDKR/$appDirDAT"
)

crear_directorio "${directorios[@]}"
# ---

escribir_archivo() {
    echo "Creando el archivo $2"
    echo "$1" > "$2" || { echo "Error al escribir $2"; exit 1; }
}
escribir_archivo "${dkrVRS}" "$dirDKR/$dkrArchENV" # Variables de entorno de Docker
escribir_archivo "${dkrYML}" "$dirDKR/$dkrArchYML" # Archivo de despliegue de Docker
# ---

# Ejecutar docker-compose
archDkrComp="$dirDKR/$dkrArchYML"
echo "Iniciando el contenedor con docker-compose..."
docker compose -f "$archDkrComp" up -d || { echo "Error al ejecutar docker-compose"; exit 1; }

# Mensaje de finalización
echo "${dkrNOM} se ha desplegado correctamente en http://localhost:${dkrPOR}/"