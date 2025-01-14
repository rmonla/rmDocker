#!/bin/bash
# Script para configurar y desplegar Homer en Docker
# Ricardo MONLA (https://github.com/rmonla)
# Homer - v250114-1933

# Variables del Docker
dkrVRS=$(cat <<YAML

dkrNOM=homer
dkrPOR=8080

dkrPUID=1000
dkrTMZ="America/Argentina/La_Rioja"

dkrArchENV=.env
dkrArchYML=docker-compose.yml

appDirCFG=config
YAML
)

dkrYML=$(cat <<YAML
services:
  homer:
    image: b4bz/homer
    container_name: \${dkrNOM}
    user:
      - \${dkrPUID}:1000 # Por defecto
    environment:
      - INIT_ASSETS=1 # Requiere que el directorio de configuración sea escribible para el usuario del contenedor
      - TZ=\${dkrTMZ} # Configuración de zona horaria
    ports:
      - \${dkrPOR}:8080
    volumes:
      - ./\${appDirCFG}:/www/assets # Asegúrate de que tu directorio de configuración local exista
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
