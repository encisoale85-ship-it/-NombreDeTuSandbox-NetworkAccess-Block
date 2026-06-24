#!/bin/bash

################################################################################
# Script: modify-sandbox.sh
# Descripción: Modificar configuración de un sandbox existente
# Uso: ./modify-sandbox.sh --name "nombre-sandbox" --network "permitido"
################################################################################

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Variables
SANDBOX_NAME=""
NETWORK_STATE=""
MODIFICATION_DATE=$(date +%Y-%m-%d)

# Función para mostrar ayuda
show_help() {
    cat << EOF
Uso: ./modify-sandbox.sh [opciones]

Opciones:
    -n, --name          Nombre del sandbox (requerido)
    -net, --network     Nuevo estado de red: bloqueado|permitido|restringido
    -status, --status   Nuevo estado: activo|inactivo|archivado
    -desc, --desc       Nueva descripción
    -h, --help          Mostrar esta ayuda

Ejemplo:
    ./modify-sandbox.sh --name "mi-sandbox" --network "permitido"
    ./modify-sandbox.sh --name "mi-sandbox" --status "inactivo"
EOF
}

# Parsear argumentos
while [[ $# -gt 0 ]]; do
    case $1 in
        -n|--name)
            SANDBOX_NAME="$2"
            shift 2
            ;;
        -net|--network)
            NETWORK_STATE="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo -e "${RED}Opción desconocida: $1${NC}"
            show_help
            exit 1
            ;;
    esac
done

# Validar nombre del sandbox
if [ -z "$SANDBOX_NAME" ]; then
    echo -e "${RED}Error: El nombre del sandbox es requerido${NC}"
    show_help
    exit 1
fi

# Crear nombre del archivo
SANDBOX_FILE="sandboxes/${SANDBOX_NAME}.md"

# Verificar si el sandbox existe
if [ ! -f "$SANDBOX_FILE" ]; then
    echo -e "${RED}Error: El sandbox '$SANDBOX_NAME' no existe${NC}"
    exit 1
fi

# Crear backup
cp "$SANDBOX_FILE" "${SANDBOX_FILE}.backup"
echo -e "${YELLOW}✓ Backup creado: ${SANDBOX_FILE}.backup${NC}"

# Modificar el archivo si se proporciona nuevo estado de red
if [ -n "$NETWORK_STATE" ]; then
    sed -i "s/- \*\*Acceso de red\*\*: .*/- **Acceso de red**: $NETWORK_STATE/" "$SANDBOX_FILE"
    echo -e "${GREEN}✓ Acceso de red actualizado a: $NETWORK_STATE${NC}"
fi

# Actualizar fecha de modificación
sed -i "s/- \*\*Última modificación\*\*: .*/- **Última modificación**: $MODIFICATION_DATE/" "$SANDBOX_FILE"

echo -e "${GREEN}✓ Sandbox '$SANDBOX_NAME' modificado exitosamente${NC}"
echo -e "  ${YELLOW}Última modificación:${NC} $MODIFICATION_DATE"

# Registrar en git
git add "$SANDBOX_FILE"
git commit -m "chore: Actualizar sandbox '$SANDBOX_NAME' - Modificación: $MODIFICATION_DATE"

echo -e "${GREEN}✓ Cambios commiteados a git${NC}"
