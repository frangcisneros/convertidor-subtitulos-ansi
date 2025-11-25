# Convertidor de Subtítulos a ANSI (para TV)

Este es un script sencillo en Bash diseñado para convertir subtítulos en formato `.srt` de **UTF-8** a **ISO-8859-1 (ANSI)**.

### ¿Por qué usar este script?

Si tienes problemas con caracteres extraños (como tildes o la letra ñ) al reproducir películas en televisores antiguos o reproductores que no soportan UTF-8, este script es la solución.

---

## Requisitos

- **Sistema Operativo:** Linux (Ubuntu, Debian, etc.)
- **Dependencia:** `iconv` (generalmente viene preinstalado en la mayoría de distribuciones Linux)

---

## Instalación

1. Descarga el archivo `convertir_sub.sh`.
2. Dale permisos de ejecución:
   ```bash
   chmod +x convertir_sub.sh
   ```

---

## Uso

1. Ejecuta el script:
   ```bash
   ./convertir_sub.sh
   ```
2. Arrastra el archivo `.srt` a la terminal cuando te lo pida.
3. El script sobrescribirá automáticamente el archivo con la codificación correcta.

---

## Autor

- **Nombre:** Francisco Cisneros

---
