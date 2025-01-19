#!/bin/bash
# Ricardo MONLA (https://github.com/rmonla)
# rmDkr.sh - v250119-1205

# Prompt:
# Genera un script en Bash para Linux llamado `rmDkr.sh` con las siguientes características:
#
# 1. Parámetros de entrada:
#    - `-r <URL>`: Recibe una URL, la almacena en la variable `urlDkrRAW` y ejecuta `curl -sSL "$urlDkrRAW" | bash`.
#      - Si se especifica la opción `-o <directorio>`, el comando se ejecutará dentro de ese directorio.
#      - Si no se proporciona `-o`, el directorio por defecto será `./rmUPs`.
#    - `-u <directorio>`: Recibe un nombre de directorio, lo almacena en la variable `dirDkrUP`, cambia a ese directorio y ejecuta `docker compose up -d`.
#    - `-x <directorio>`: Recibe un directorio dentro del cual se ejecuta `docker compose down -v --rmi local --remove-orphans`.
#
# 2. Restricciones:
#    - Solo puede usarse una de las opciones `-r`, `-u` o `-x`, no múltiples opciones juntas.
#    - Si se usa `-r`, se valida la existencia del directorio especificado en `-o` (o `./rmUPs` si no se define `-o`) y se entra en él antes de ejecutar el comando.
#    - Se deben manejar correctamente los errores y validar los parámetros.
#
# Genera el script listo para ejecutarse.

set -e

mostrar_uso() {
    echo "Uso: $0 -r <URL> [-o <directorio>] | -u <directorio> | -x <directorio>"
    exit 1
}

if [[ $# -eq 0 ]]; then
    mostrar_uso
fi

while getopts ":r:o:d:x:" opt; do
    case ${opt} in
        r)
            if [[ -n "$dirDkrUP" || -n "$dirDkrDOWN" ]]; then
                echo "Error: No se puede usar -r con -u o -x."
                mostrar_uso
            fi
            urlDkrRAW="$OPTARG"
            ;;
        o)
            if [[ -z "$urlDkrRAW" ]]; then
                echo "Error: -o solo se puede usar con -r."
                mostrar_uso
            fi
            dirDkrDST="$OPTARG"
            ;;
        u)
            if [[ -n "$urlDkrRAW" || -n "$dirDkrDOWN" ]]; then
                echo "Error: No se puede usar -u con -r o -x."
                mostrar_uso
            fi
            dirDkrUP="$OPTARG"
            ;;
        x)
            if [[ -n "$urlDkrRAW" || -n "$dirDkrUP" ]]; then
                echo "Error: No se puede usar -x con -r o -d."
                mostrar_uso
            fi
            dirDkrDOWN="$OPTARG"
            ;;
        *)
            mostrar_uso
            ;;
    esac
done

if [[ -n "$urlDkrRAW" ]]; then
    dirDkrDST="${dirDkrDST:-./rmUPs}"
    mkdir -p "$dirDkrDST"
    cd "$dirDkrDST"
    echo "Ejecutando script desde URL en $dirDkrDST"
    curl -sSL "$urlDkrRAW" | bash
elif [[ -n "$dirDkrUP" ]]; then
    if [[ ! -d "$dirDkrUP" ]]; then
        echo "Error: El directorio '$dirDkrUP' no existe."
        exit 1
    fi
    cd "$dirDkrUP"
    echo "Ejecutando 'docker compose up -d' en $dirDkrUP"
    docker compose up -d
elif [[ -n "$dirDkrDOWN" ]]; then
    if [[ ! -d "$dirDkrDOWN" ]]; then
        echo "Error: El directorio '$dirDkrDOWN' no existe."
        exit 1
    fi
    cd "$dirDkrDOWN"
    echo "Ejecutando 'docker compose down -v --rmi local --remove-orphans' en $dirDkrDOWN"
    docker compose down -v --rmi local --remove-orphans
    rm -rf "$dirDkrDOWN" && echo "Directorio $dirDkrDOWN eliminado."
else
    mostrar_uso
fi
