#!/bin/bash
# Ricardo MONLA (https://github.com/rmonla)
# rmDkrClean - v250117-2345

if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_del_contenedor>"
    exit 1
fi

dkrNOM="$1"

# Obtiene el ID del contenedor
dkrID=$(sudo docker ps -q --filter "name=^${dkrNOM}$")

if [ -z "$dkrID" ]; then
    echo "No se encontró un contenedor con el nombre: $dkrNOM"
    exit 1
fi

# Obtiene la imagen asociada
dkrIMG=$(sudo docker inspect --format '{{.Image}}' "$dkrID")

# Obtiene las redes asociadas al contenedor
dkrNETS=$(sudo docker inspect --format '{{range .NetworkSettings.Networks}}{{.NetworkID}} {{end}}' "$dkrID")

# Detiene y elimina el contenedor
sudo docker stop "$dkrID"
sudo docker rm "$dkrID"

# Elimina las redes si no están en uso por otros contenedores
for net in $dkrNETS; do
    netName=$(sudo docker network inspect --format '{{.Name}}' "$net")
    if [ -n "$netName" ]; then
        sudo docker network rm "$netName" && echo "Red $netName eliminada."
    fi
done

# Intenta eliminar la imagen si no está en uso
if sudo docker images -q "$dkrIMG" &>/dev/null; then
    sudo docker rmi "$dkrIMG" && echo "Imagen $dkrIMG eliminada."
fi

# Eliminación segura del directorio
if [ -d "$dkrNOM" ]; then
    sudo rm -rf "$dkrNOM"
    echo "Directorio $dkrNOM eliminado."
fi

echo "Proceso completado."
