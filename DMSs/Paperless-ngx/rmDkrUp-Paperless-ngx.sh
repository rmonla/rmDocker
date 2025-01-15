#!/bin/bash
# Script para configurar y desplegar Paperless-ngx en Docker
# Ricardo MONLA (https://github.com/rmonla)
# Paperless-ngx - v250114-2244

# Variables del Docker
dkrVRS=$(cat <<YAML

dkrNOM=paperless-ngx
dkrPOR=8000

dkrPGID=1000
dkrPUID=1000
dkrTMZ=America/Argentina/La_Rioja

dkrArchENV=.env
dkrArchYML=docker-compose.yml

appDirCFG=config
appDirDAT=data
YAML
)

dkrYML=$(cat <<YAML
services:
  paperless-ngx:
    image: lscr.io/linuxserver/paperless-ngx:latest
    container_name: \${dkrNOM}
    environment:
      - PUID=\${dkrPGID}
      - PGID=\${dkrPUID}
      - TZ=\${dkrTMZ}
      - REDIS_URL= # optional
    volumes:
      - ./\${appDirCFG}:/config
      - ./\${appDirDAT}:/data
    ports:
      - \${dkrPOR}:8000
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
    "$dirDKR/$appDirCFG"
    "$dirDKR/$appDirDAT"
    # "$dirDKR"
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
