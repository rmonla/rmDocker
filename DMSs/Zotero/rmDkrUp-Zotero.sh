#!/bin/bash
# Script para configurar y desplegar Paperless-ngx en Docker
# Ricardo MONLA (https://github.com/rmonla)
# Zotero - v250115-1521

# Variables del Docker
dkrVRS=$(cat <<YAML

dkrNOM=zotero
dkrPOR=3000

dkrPGID=1000
dkrPUID=1000
dkrTMZ=America/Argentina/La_Rioja

dkrArchENV=.env
dkrArchYML=docker-compose.yml

appDirCFG=config
YAML
)

dkrYML=$(cat <<YAML
services:
  zotero:
    image: lscr.io/linuxserver/zotero:latest
    container_name: \${dkrNOM}
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=\${dkrPGID}
      - PGID=\${dkrPUID}
      - TZ=\${dkrTMZ}
    volumes:
      - ./\${appDirCFG}:/config
    ports:
      - \${dkrPOR}:3000
      - 3001:3001
    shm_size: "1gb"
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
