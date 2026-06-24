# 📦 Sandbox Network Access Block - Archivo de Sandboxes

Sistema centralizado para gestionar, documentar y controlar todos los sandboxes creados con reglas de acceso de red.

## 📋 Descripción

Este repositorio actúa como un **archivo maestro** para:
- ✅ Registrar todos los sandboxes creados
- ✅ Modificar configuraciones de acceso de red
- ✅ Eliminar sandboxes obsoletos
- ✅ Mantener un historial de cambios
- ✅ Automatizar la gestión de sandboxes

## 📁 Estructura del Proyecto

```
-NombreDeTuSandbox-NetworkAccess-Block/
├── README.md                      # Este archivo
├── CHANGELOG.md                   # Historial de cambios
├── sandboxes/                     # Carpeta de sandboxes activos
│   ├── sandbox-template.md        # Plantilla
│   └── [sandbox-name].md          # Archivos de sandboxes
├── config/
│   ├── network-access.json        # Reglas de acceso de red
│   ├── block-rules.json           # Reglas de bloqueo
│   └── settings.json              # Configuración general
├── scripts/
│   ├── create-sandbox.sh          # Script crear sandbox
│   ├── modify-sandbox.sh          # Script modificar sandbox
│   ├── delete-sandbox.sh           # Script eliminar sandbox
│   └── list-sandboxes.sh          # Script listar sandboxes
└── archive/                       # Sandboxes eliminados
    └── [old-sandbox-name].md
```

## 🚀 Guía Rápida

### Crear un Nuevo Sandbox

```bash
./scripts/create-sandbox.sh --name "mi-sandbox" --network "bloqueado"
```

### Listar Todos los Sandboxes

```bash
./scripts/list-sandboxes.sh
```

### Modificar un Sandbox

```bash
./scripts/modify-sandbox.sh --name "mi-sandbox" --network "permitido"
```

### Eliminar un Sandbox

```bash
./scripts/delete-sandbox.sh --name "mi-sandbox"
```

## 📝 Formato de Archivo Sandbox

Ver plantilla en: `sandboxes/sandbox-template.md`

```markdown
# Sandbox: [Nombre]

## Información General
- **ID**: sandbox-XXX
- **Fecha de creación**: YYYY-MM-DD
- **Estado**: Activo | Inactivo | Archivado
- **Última modificación**: YYYY-MM-DD

## Configuración de Red
- **Acceso de red**: Bloqueado | Permitido | Restringido
- **Puertos permitidos**: [lista de puertos]
- **Dominios bloqueados**: [lista de dominios]
- **IPs permitidas**: [lista de IPs]

## Descripción y Propósito
[Descripción detallada del sandbox]

## Historial de Modificaciones
- YYYY-MM-DD: [descripción del cambio]
```

## ⚙️ Configuración de Red

Ver: `config/network-access.json`

Define reglas globales y específicas para cada sandbox.

## 🔄 Historial de Cambios

Ver: `CHANGELOG.md`

Registro de todas las operaciones realizadas en sandboxes.

## 📊 Estadísticas

- **Sandboxes Activos**: [Auto-actualizado]
- **Sandboxes Inactivos**: [Auto-actualizado]
- **Sandboxes Archivados**: [Auto-actualizado]

## 🛠️ Automatización

Los scripts en `scripts/` permiten automatizar:
- Creación masiva de sandboxes
- Aplicar cambios globales
- Generar reportes
- Limpiar sandboxes antiguos

## 📚 Documentación Adicional

- [Guía de Creación de Sandboxes](docs/crear-sandbox.md)
- [Reglas de Acceso de Red](docs/reglas-red.md)
- [Resolución de Problemas](docs/troubleshooting.md)

## 👤 Autor

**encisoale85-ship-it**

## 📄 Licencia

MIT
