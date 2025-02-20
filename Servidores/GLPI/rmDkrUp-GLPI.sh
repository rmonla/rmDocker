#!/bin/bash
# Script para configurar y desplegar GLPI en Docker
# Ricardo MONLA (https://github.com/rmonla)
# rmDkrUp-GLPI.sh  - v250220-2005

# Variables del Docker
dkrVRS=$(cat <<YAML

dkrNOM=glpi
dkrPOR=7080

dkrArchENV=.env
dkrArchYML=docker-compose.yml

appDirCFG=config

MARIADB_ROOT_PASSWORD=pass_root
MARIADB_GLPI_PASSWORD=pass_glpi
MARIADB_DATABASE=glpi_db
MARIADB_USER=glpi_user

YAML
)

dkrYML=$(cat <<YAML
services:
  mariadb:
    image: mariadb:10.7
    container_name: glpi_mariadb
    environment:
      - MARIADB_ROOT_PASSWORD=\${MARIADB_ROOT_PASSWORD}
      - MARIADB_DATABASE=glpi
      - MARIADB_USER=glpi_user
      - MARIADB_PASSWORD=\${MARIADB_GLPI_PASSWORD}
    volumes:
      - mariadb_data:/var/lib/mysql
    networks:
      - glpi_network

  glpi:
    image: diouxx/glpi
    container_name: \${dkrNOM}
    ports:
      - "\${dkrPOR}:80"
    environment:
      - TIMEZONE=America/Argentina/La_Rioja
    volumes:
      - glpi_data:/var/www/html/glpi
    networks:
      - glpi_network
    depends_on:
      - mariadb

networks:
  glpi_network:

volumes:
  mariadb_data:
  glpi_data:

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
