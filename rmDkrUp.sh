#!/bin/bash
# Script para configurar y desplegar Homer en Docker
# Ricardo MONLA (https://github.com/rmonla)
# rmDkrUp - v250116-1943

# Verifica si se ha pasado un parámetro
if [ -z "$1" ]; then
    echo "Uso: $0 <URL Raw de GitHub>"
    exit 1
fi

rawURL="$1"

curl -sSL "$rawURL" | bash
