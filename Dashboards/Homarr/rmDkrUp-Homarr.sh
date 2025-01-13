#!/bin/bash
# Script para configurar y desplegar Heimdall en Docker
# Ricardo MONLA (https://github.com/rmonla)
# Heimdall - v250113-0202

# Variables del Docker
dkrVRS=$(cat <<YAML

dkrNOM=homarr
dkrPOR=7575

dkrArchENV=.env
dkrArchYML=docker-compose.yml

appDirCFG=configs
appDirICO=icons
appDirDAT=data
YAML
)

dkrYML=$(cat <<YAML
services:
  homarr:
    image: ghcr.io/ajnart/homarr:latest
    container_name: \${dkrNOM}
    ports:
      - '\${dkrPOR}:7575'
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # Integración opcional con Docker
      - ./\${appDirCFG}:/app/data/configs
      - ./\${appDirICO}:/app/public/icons
      - ./\${appDirDAT}:/data
    restart: unless-stopped

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
    # "$dirDKR"
    "$dirDKR/$appDirCFG"
    "$dirDKR/$appDirICO"
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
echo "${dkrNOM} se ha desplegado correctamente en http://0.0.0.0:${dkrPOR}/"
