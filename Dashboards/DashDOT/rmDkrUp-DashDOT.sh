#!/bin/bash
# Script para configurar y desplegar DashDOT en Docker
# Ricardo MONLA (https://github.com/rmonla)
# DashDOT - v250112-2153

# Variables del Docker
dkrVRS=$(cat <<YAML

dkrNOM=dashdot
dkrPOR=3002

dkrArchENV=.env
dkrArchYML=docker-compose.yml

# appDirCFG=config
YAML
)

dkrYML=$(cat <<YAML
services:
    dashdot:
        container_name: ${dkr_NOM}
        ports:
            - ${dkr_POR}:3001
        environment:
            - DASHDOT_ENABLE_CPU_TEMPS=true
            - DASHDOT_OVERRIDE_OS=DSM
        volumes:
            - /:/mnt/host:ro
        privileged: true
        restart: always
        image: mauricenino/dashdot

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
    "$dirDKR"
    # "$dirDKR/$appDirCFG"
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
