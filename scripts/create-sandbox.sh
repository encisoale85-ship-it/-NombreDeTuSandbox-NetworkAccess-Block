#!/bin/bash

################################################################################
# Script: create-sandbox.sh
# Descripción: Crear un nuevo sandbox con configuración de red
# Uso: ./create-sandbox.sh --name "nombre-sandbox" --network "bloqueado"
################################################################################

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Variables
SANDBOX_NAME=""
NETWORK_STATE="bloqueado"
SANDBOX_ID=""
CREATION_DATE=$(date +%Y-%m-%d)

# Función para mostrar ayuda
show_help() {
    cat << EOF
Uso: ./create-sandbox.sh [opciones]

Opciones:
    -n, --name          Nombre del sandbox (requerido)
    -net, --network     Estado de red: bloqueado|permitido|restringido (default: bloqueado)
    -h, --help          Mostrar esta ayuda

Ejemplo:
    ./create-sandbox.sh --name "mi-sandbox" --network "permitido"
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

# Generar ID del sandbox
SANDBOX_ID="sandbox-$(date +%s)"

# Crear nombre del archivo
SANDBOX_FILE="sandboxes/${SANDBOX_NAME}.md"

# Verificar si el sandbox ya existe
if [ -f "$SANDBOX_FILE" ]; then
    echo -e "${RED}Error: El sandbox '$SANDBOX_NAME' ya existe${NC}"
    exit 1
fi

# Crear el archivo del sandbox
cat > "$SANDBOX_FILE" << EOF
# Sandbox: $SANDBOX_NAME

## Información General

- **ID**: $SANDBOX_ID
- **Fecha de creación**: $CREATION_DATE
- **Estado**: Activo
- **Última modificación**: $CREATION_DATE
- **Creado por**: $(git config user.name || echo "usuario-desconocido")

## Configuración de Red

- **Acceso de red**: $NETWORK_STATE
- **Puertos permitidos**: 
  - 80 (HTTP)
  - 443 (HTTPS)
- **Dominios bloqueados**: []
- **IPs permitidas**: []
- **Dominios permitidos**: 
  - github.com
  - google.com

## Descripción y Propósito

[Añadir descripción del sandbox]

## Reglas de Bloqueo

- Bloquear torrents: No
- Bloquear P2P: No
- Bloquear VPN: No
- Bloquear Proxy: No

## Recursos Asignados

- **CPU**: Sin límite
- **Memoria RAM**: Sin límite
- **Almacenamiento**: Sin límite
- **Ancho de banda**: Sin límite

## Historial de Modificaciones

| Fecha | Cambio | Realizado por |
|-------|--------|---------------|
| $CREATION_DATE | Sandbox creado | $(git config user.name || echo "usuario") |

## Notas Adicionales

Sandbox creado automáticamente mediante script.

## Estado de Cumplimiento

- ✅ Sandbox creado
- ⏳ Reglas de red pendientes
- ⏳ Verificación pendiente
EOF

echo -e "${GREEN}✓ Sandbox '$SANDBOX_NAME' creado exitosamente${NC}"
echo -e "  ${YELLOW}ID:${NC} $SANDBOX_ID"
echo -e "  ${YELLOW}Archivo:${NC} $SANDBOX_FILE"
echo -e "  ${YELLOW}Estado de red:${NC} $NETWORK_STATE"

# Registrar en git
git add "$SANDBOX_FILE"
git commit -m "feat: Crear nuevo sandbox '$SANDBOX_NAME' con acceso $NETWORK_STATE"

echo -e "${GREEN}✓ Cambios commiteados a git${NC}"
