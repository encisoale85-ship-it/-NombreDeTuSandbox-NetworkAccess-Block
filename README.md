# Sandbox Network Access Management

Centralized repository for documenting, managing, and auditing sandbox environments with controlled network access policies.

## Overview

This repository serves as a structured registry for sandbox instances used in testing, development, security validation, or controlled operational environments. Its purpose is to provide a consistent and auditable record of each sandbox, including its configuration, lifecycle status, and network access rules.

## Objectives

- Maintain a single source of truth for all sandbox environments
- Standardize the documentation of each sandbox instance
- Define and track network access policies clearly and consistently
- Support creation, modification, and archival workflows
- Improve traceability and operational governance through version control

## Key Features

- Standardized sandbox template for consistent documentation
- Centralized configuration files for network policies and access rules
- Scripts to create, list, update, and archive sandboxes
- Version-controlled audit trail through Git history
- Structured documentation for onboarding and maintenance

## Repository Structure

```text
-NombreDeTuSandbox-NetworkAccess-Block/
├── README.md
├── CHANGELOG.md
├── sandboxes/
│   ├── sandbox-template.md
│   └── [sandbox-name].md
├── config/
│   ├── network-access.json
│   ├── block-rules.json
│   └── settings.json
├── scripts/
│   ├── create-sandbox.sh
│   ├── list-sandboxes.sh
│   ├── modify-sandbox.sh
│   ├── delete-sandbox.sh
│   └── setup.sh
├── archive/
└── docs/
    ├── crear-sandbox.md
    ├── reglas-red.md
    ├── troubleshooting.md
    └── quick-start.md
```

## Getting Started

1. Clone the repository.
2. Run the initial setup:

```bash
./scripts/setup.sh
```

3. Create a sandbox:

```bash
./scripts/create-sandbox.sh --name "demo-sandbox" --network "bloqueado"
```

4. Review the current inventory:

```bash
./scripts/list-sandboxes.sh
```

## Sandbox Record Format

Each sandbox should be documented using the template available at:

- `sandboxes/sandbox-template.md`

A typical record includes:
- Identification and ownership information
- Creation and modification dates
- Current state and lifecycle status
- Network access policy
- Allowed or blocked ports, domains, and IP ranges
- Purpose and usage notes
- Change history

## Configuration Files

The repository includes configuration files to support consistent policy definitions:

- `config/network-access.json`: global network access configuration
- `config/block-rules.json`: blocking and security rules
- `config/settings.json`: repository-wide settings and governance parameters

## Automation Scripts

The following scripts are available to simplify routine operations:

- `scripts/create-sandbox.sh`: creates a new sandbox record
- `scripts/list-sandboxes.sh`: lists active and archived sandboxes
- `scripts/modify-sandbox.sh`: updates sandbox configuration
- `scripts/delete-sandbox.sh`: archives or permanently deletes a sandbox
- `scripts/setup.sh`: prepares the repository structure and permissions

## Governance and Security Recommendations

To keep the repository useful and secure, it is recommended to:

- Apply the principle of least privilege for each sandbox
- Maintain clear descriptions of the purpose of every sandbox
- Review and archive inactive environments periodically
- Keep changes traceable through Git commits
- Preserve backups before significant configuration changes

## Documentation

Additional technical and operational documentation is available in the `docs/` folder:

- `docs/crear-sandbox.md`
- `docs/reglas-red.md`
- `docs/troubleshooting.md`
- `docs/quick-start.md`

## Maintenance

This repository is intended to evolve as sandbox management requirements grow. Future improvements may include:

- API-based management workflows
- Web dashboard visualization
- CI/CD integration
- Automated reporting and alerts

## License

This project is distributed under the MIT License.
