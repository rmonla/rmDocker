#!/bin/bash
# Ricardo MONLA (https://github.com/rmonla)
# rmDkrUp - v250118-2125

# Prompt:
# Genera un script en Bash para Linux llamado `rmDkrUp.sh` con las siguientes características:
# 
# 1. **Parámetros de entrada:**
#    - `-r <URL>`: Recibe una URL, la almacena en la variable `rawURL` y ejecuta `curl -sSL "$rawURL" | bash`.
#      - Si se especifica la opción `-o <directorio>`, el comando se ejecutará dentro de ese directorio.
#      - Si no se proporciona `-o`, el directorio por defecto será `./rmdocker`.
#    - `-d <directorio>`: Recibe un nombre de directorio, lo almacena en la variable `dkrDIR`, cambia a ese directorio y ejecuta `docker compose up -d`.
# 
# 2. **Restricciones:**
#    - Solo puede usarse `-r` o `-d`, no ambas opciones juntas.
#    - Si se usa `-r`, se valida la existencia del directorio especificado en `-o` (o `./rmdocker` si no se define `-o`) y se entra en él antes de ejecutar el comando.
#    - Se deben manejar correctamente los errores y validar los parámetros.
# 
# Genera el script listo para ejecutarse.

# Variables
rawURL=""
dkrDIR=""
outDIR="./rmdocker"

# Procesar opciones
while getopts ":r:d:o:" opt; do
  case ${opt} in
    r)
      rawURL="$OPTARG"
      ;;
    d)
      dkrDIR="$OPTARG"
      ;;
    o)
      outDIR="$OPTARG"
      ;;
    *)
      echo "Uso: $0 [-r <URL> [-o <directorio>]] | [-d <directorio>]"
      exit 1
      ;;
  esac
done

# Validar que no se usen ambas opciones a la vez
if [[ -n "$rawURL" && -n "$dkrDIR" ]]; then
  echo "Error: No se puede usar -r y -d al mismo tiempo."
  exit 1
fi

# Ejecutar comando según la opción ingresada
if [[ -n "$rawURL" ]]; then
  mkdir -p "$outDIR" || { echo "Error al crear el directorio $outDIR"; exit 1; }
  cd "$outDIR" || { echo "Error al acceder al directorio $outDIR"; exit 1; }
  echo "Ejecutando script desde: $rawURL en $outDIR"
  curl -sSL "$rawURL" | bash
elif [[ -n "$dkrDIR" ]]; then
  if [[ ! -d "$dkrDIR" ]]; then
    echo "Error: El directorio $dkrDIR no existe."
    exit 1
  fi
  cd "$dkrDIR" || { echo "Error al acceder al directorio $dkrDIR"; exit 1; }
  echo "Iniciando Docker Compose en $dkrDIR"
  docker compose up -d
else
  echo "Error: Debe especificar -r o -d."
  exit 1
fi

