#!/bin/bash
# Script para configurar y desplegar Jellyfin en Docker
# Ricardo MONLA (https://github.com/rmonla)
# Jellyfin - v250118-1059

# Variables del Docker
codDkrENVs=$(cat <<YAML
dkrNOM=jellyfin
dkrPOR=8096

dkrUID=1000
dkrGID=1000
dkrTMZ="America/Argentina/La_Rioja"

archDkrENVs=.env
archDkrCOMP=docker-compose.yml
YAML
)

codDkrCOMP=$(cat <<YAML
services:
  jellyfin:
    image: lscr.io/linuxserver/jellyfin:latest
    container_name: \${dkrNOM}
    environment:
      - PUID=\${dkrUID}
      - PGID=\${dkrGID}
      - TZ=\${dkrTMZ}
      - JELLYFIN_PublishedServerUrl=0.0.0.0 #optional
    volumes:
      - ./config:/config
      - ./tvseries:/data/tvshows
      - ./movies:/data/movies
    ports:
      - \${dkrPOR}:8096
      - 8920:8920 #optional
      # - 7359:7359/udp #optional
      # - 1900:1900/udp #optional
    restart: unless-stopped
YAML
)

# Exportar variables de entorno
eval "$(echo "$codDkrENVs" | grep -E '^[a-zA-Z_][a-zA-Z0-9_]*=' | sed 's/^/export /')"

# Definir rutas
dirDKR="$(pwd)/$dkrNOM"
aDkrENVs="$dirDKR/$archDkrENVs"
aDkrCOMP="$dirDKR/$archDkrCOMP"

# Crear directorios
crear_directorio() {
    for newDir in "$@"; do
        echo "Creando el directorio $newDir"
        mkdir -p "$newDir" || { echo "Error al crear el directorio $newDir"; exit 1; }
    done
}

directorios=(
    "$dirDKR"   # Se agrega el directorio donde se guardarán los archivos
)

crear_directorio "${directorios[@]}"

# Función para escribir archivos desde un array asociativo
escribir_archivos() {
    local archivo
    for archivo in "${!archivos_a_escribir[@]}"; do
        contenido="${archivos_a_escribir[$archivo]}"

        if [[ -z "$contenido" || -z "$archivo" ]]; then
            echo "Error: Parámetro vacío en escribir_archivos"
            exit 1
        fi

        echo "Creando el archivo $archivo"
        echo "$contenido" > "$archivo" || { echo "Error al escribir $archivo"; exit 1; }
    done
}

# Definir array asociativo con archivos como clave y contenido como valor
declare -A archivos_a_escribir=(
    ["$aDkrENVs"]="$codDkrENVs"
    ["$aDkrCOMP"]="$codDkrCOMP"
)

escribir_archivos

# Ejecutar docker-compose
echo "Iniciando el contenedor con docker-compose..."
docker compose -f "$aDkrCOMP" up -d || { echo "Error al ejecutar docker-compose"; exit 1; }

# Mensaje de finalización
echo "${dkrNOM} se ha desplegado correctamente en http://localhost:${dkrPOR}/"
