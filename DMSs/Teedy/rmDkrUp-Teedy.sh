#!/bin/bash
# Script para configurar y desplegar Paperless-ngx en Docker
# Ricardo MONLA (https://github.com/rmonla)
# Teedy - v250115-1311

# Variables del Docker
dkrVRS=$(cat <<YAML

dkrNOM=teedy-dms
dkrPOR=8080

dkrArchENV=.env
dkrArchYML=docker-compose.yml

appDirDAT=data
YAML
)

dkrYML=$(cat <<YAML
services:
  teedy-dms:
    image: sismics/docs:v1.11
    container_name: \${dkrNOM}
    ports:
      - \${dkrPOR}:8080
    environment:
      # Base url to be used
      DOCS_BASE_URL: "https://docs.example.com"
      # Set the admin email
      DOCS_ADMIN_EMAIL_INIT: "admin@example.com"
      # Set the admin password (in this example: "superSecure")
      DOCS_ADMIN_PASSWORD_INIT: "$$2a$$05$$PcMNUbJvsk7QHFSfEIDaIOjk1VI9/E7IPjTKx.jkjPxkx2EOKSoPS"
    volumes:
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
