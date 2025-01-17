# rm_dkrclean v-2.2 verificar

# Verifica si se ha pasado un parámetro
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_del_contenedor_o_imagen>"
    exit 1
fi

dkrNOM="$1"

# Obtiene el ID del contenedor basado en el nombre o imagen
dkrID=$(sudo docker ps | grep $dkrNOM | awk '{print $1}')

# Verifica si se encontró el contenedor
if [ -z "$dkrID" ]; then
    echo "No se encontró un contenedor con el nombre o imagen: $dkrNOM"
    exit 1
fi

# Obtiene la imagen asociada al contenedor
dkrIMG=$(sudo docker ps --filter "id=$dkrID" --format "{{.Image}}")

# Detiene, elimina el contenedor y elimina la imagen
sudo docker stop $dkrID
sudo docker rm $dkrID
sudo docker rmi $dkrIMG
echo "Contenedor $dkrNOM eliminado junto con su imagen asociada."

sudo rm -R $dkrNOM
echo "Directorio $dkrNOM eliminado."



