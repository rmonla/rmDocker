#!/bin/bash
# Script para configurar y desplegar Jellyfin en Docker
# Ricardo MONLA (https://github.com/rmonla)
# Jellyfin - v250118-1038

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
    image: jellyfin/jellyfin
    container_name: \${dkrNOM}
    user: \${dkrUID}:\${dkrGID}
    network_mode: 'host'
    volumes:
      - ./config:/config
      - ./cache:/cache
      - type: bind
        source: ./media
        target: /media
      - type: bind
        source: ./media2
        target: /media2
        read_only: true
      # Optional - extra fonts to be used during transcoding with subtitle burn-in
      - type: bind
        source: ./fonts
        target: /usr/local/share/fonts/custom
        read_only: true
    restart: 'unless-stopped'
    # Optional - alternative address used for autodiscovery
    environment:
      - JELLYFIN_PublishedServerUrl=http://localhost
    # Optional - may be necessary for docker healthcheck to pass if running in host network mode
    extra_hosts:
      - 'host.docker.internal:host-gateway'
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
