#!/bin/bash

echo "============================================"
echo "   CONVERTIDOR DE SUBTÍTULOS A ANSI (TV)    "
echo "============================================"
echo "Por favor, arrastra el archivo .srt aquí y presiona ENTER:"

# Lee la ruta del archivo (el modificador -r evita problemas con barras invertidas)
read -r input_path

# 1. Limpieza de la ruta:
# Al arrastrar archivos en Ubuntu, la terminal suele poner comillas simples (' ') 
# alrededor de la ruta. Las quitamos para que el comando funcione.
clean_path=$(echo "$input_path" | tr -d "'")

# Verificamos si el archivo existe
if [ ! -f "$clean_path" ]; then
    echo "❌ Error: No se encuentra el archivo. Asegúrate de arrastrarlo bien."
    exit 1
fi

# Definimos nombre temporal
temp_file="${clean_path}.temp"

# 2. Conversión:
# Intentamos convertir de UTF-8 a ISO-8859-1 (ANSI)
echo "Convirtiendo..."
iconv -f UTF-8 -t ISO-8859-1 "$clean_path" -o "$temp_file"

# 3. Verificación y Sobrescritura:
# $? revisa si el comando anterior (iconv) fue exitoso (código 0)
if [ $? -eq 0 ]; then
    mv "$temp_file" "$clean_path"
    echo "¡Éxito! El archivo ha sido sobrescrito en formato ANSI."
else
    echo "Error en la conversión. El archivo original NO se ha tocado."
    rm -f "$temp_file" # Borramos el temporal si falló
fi

echo "Presiona ENTER para salir..."
read
