#!/bin/bash
# Script para configurar y desplegar Pi-hole en Docker
# Ricardo MONLA (https://github.com/rmonla)
# Pi-hole - v250117-2305

# Variables del Docker
codDkrENVs=$(cat <<YAML
dkrNOM=pihole
dkrPOR=7080

dkrTMZ="America/Argentina/La_Rioja"

archDkrENVs=.env
archDkrCOMP=docker-compose.yml
YAML
)

codDkrCOMP=$(cat <<YAML
# More info at https://github.com/pi-hole/docker-pi-hole/ and https://docs.pi-hole.net/
services:
  pihole:
    container_name: \${dkrNOM}
    image: pihole/pihole:latest
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "67:67/udp"
      - "\${dkrPOR}:80/tcp"
    environment:
      TZ: '\${dkrTMZ}'
    volumes:
      - '$(pwd)/etc-pihole:/etc/pihole'
      - '$(pwd)/etc-dnsmasq.d:/etc/dnsmasq.d'
    cap_add:
      - NET_ADMIN
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
