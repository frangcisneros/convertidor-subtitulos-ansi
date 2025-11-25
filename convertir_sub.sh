#!/bin/bash

# Función de limpieza
function cleanup() {
    if [ -f "$temp_file" ]; then
        rm -f "$temp_file"
    fi
}
trap cleanup EXIT

echo "============================================"
echo "   CONVERTIDOR DE SUBTITULOS A ANSI (TV)    "
echo "============================================"
echo "Por favor, arrastra el archivo .srt aqui y presiona ENTER:"

read -r input_path

# Limpieza de la ruta
clean_path=$(echo "$input_path" | tr -d "'")

# VERIFICACION 1: ¿Existe el archivo?
if [ ! -f "$clean_path" ]; then
    echo "Error: No se encuentra el archivo o no es valido."
    echo "Presiona ENTER para cerrar..."
    read
    exit 1
fi

# Intentamos crear el temporal
temp_file=$(mktemp) || { 
    echo "Error al crear archivo temporal"; 
    echo "Presiona ENTER para cerrar..."; 
    read; 
    exit 1; 
}

echo "Convirtiendo..."

# MODIFICACION IMPORTANTE: Agregamos -c y TRANSLIT
# -c: Salta los errores en vez de frenar.
# TRANSLIT: Aproxima caracteres que no tienen traduccion directa.
if iconv -c -f UTF-8 -t ISO-8859-1//TRANSLIT "$clean_path" -o "$temp_file"; then
    mv "$temp_file" "$clean_path"
    echo "Exito! El archivo ha sido convertido a ANSI."
else
    echo "Error critico en la conversion."
    echo "El archivo original NO se ha tocado."
    echo "Presiona ENTER para cerrar..."
    read
    exit 1
fi

echo "Presiona ENTER para salir..."
read