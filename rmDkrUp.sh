#!/bin/bash
# Ricardo MONLA (https://github.com/rmonla)
# rmDkrUp - v250118-2107

#!/bin/bash

modo_de_uso() {
    echo "Uso: $0 -r <URL> | -d <directorio>"
    exit 1
}

# Validar que se proporciona exactamente un argumento
if [[ $# -ne 2 ]]; then
    modo_de_uso
fi

while getopts ":r:d:" opt; do
    case "$opt" in
        r)
            rawURL="$OPTARG"
            if [[ -n "$dkrDIR" ]]; then
                echo "Error: No se puede usar -r y -d al mismo tiempo."
                modo_de_uso
            fi
            echo "Ejecutando script desde URL: $rawURL"
            curl -sSL "$rawURL" | bash
            exit 0
            ;;
        d)
            dkrDIR="$OPTARG"
            if [[ -n "$rawURL" ]]; then
                echo "Error: No se puede usar -r y -d al mismo tiempo."
                modo_de_uso
            fi
            if [[ ! -d "$dkrDIR" ]]; then
                echo "Error: El directorio '$dkrDIR' no existe."
                exit 1
            fi
            echo "Ingresando al directorio: $dkrDIR"
            cd "$dkrDIR" || exit 1
            echo "Ejecutando 'docker compose up -d'"
            docker compose up -d
            exit 0
            ;;
        *)
            modo_de_uso
            ;;
    esac
done

# Si no se pasó ninguna opción válida
modo_de_uso

