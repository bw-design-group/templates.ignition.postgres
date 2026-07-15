# Ignition 8.3 + PostgreSQL Template

A Docker Compose template for quickly setting up an Ignition 8.3 gateway with PostgreSQL database and optional pgAdmin for development.

## Quick Start

1. **Start the services:**
   ```bash
   docker compose up -d
   ```

2. **Access the gateway:**
   - Ignition Gateway: https://ignition83.localtest.me (requires Traefik proxy)
   - Or direct access: http://localhost:8088

## What's Included

- **Ignition 8.3.8** with Standard Edition
- **PostgreSQL** database with Liquibase migrations
- **pgAdmin** for database management
- **Traefik** integration for local development
- **Flint Designer Bridge module** pre-installed for VS Code integration

## Services

| Service | Description | Access |
|---------|-------------|---------|
| gateway | Ignition 8.3 Gateway | https://ignition83.localtest.me |
| database | PostgreSQL 18 | localhost:5432 |
| pgadmin | Database administration | https://postgres-pgadmin.localtest.me |
| liquibase | Database migrations | Runs once on startup |

## Database Setup

The template includes Liquibase for database version control:

- **Main changelog:** `services/postgres/liquibase/main.yaml`
- **Table definitions:** `services/postgres/tables/`
- **Simulated data:** `services/postgres/simulated-data/`
- **Init scripts:** `services/postgres/init-sql/`

## Configuration

### Database Connection
- **Host:** postgres (internal) or localhost:5432 (external)
- **Database:** `postgres`
- **Username:** `postgres`
- **Password:** `P@ssword1!`

### pgAdmin Access
- **Email:** `admin@admin.com`
- **Password:** `root`

### Ignition Access
- **Username:** `admin`
- **Password:** `P@ssword1!`

## VS Code Integration (Flint)

This template works out of the box with the [Flint VS Code extension](https://marketplace.visualstudio.com/items?itemName=Keith-gamble.ignition-flint) ([docs](https://flint.docs.bwdesigngroup.dev)):

1. Install the extension (VS Code will recommend it when you open the workspace).
2. Start the stack with `docker compose up -d`. The gateway loads the [Flint Designer Bridge module](https://github.com/bw-design-group/flint-designer-bridge-ignition-module) from `services/ignition/modules/`.
3. Open the workspace — `flint.config.json` already points at the gateway and `services/ignition/projects/`.
4. Launch a Designer against the gateway. Flint discovers and connects to it automatically within a few seconds.

Per-developer overrides go in `flint.local.json` (gitignored). The module binary is tracked with **Git LFS**, so make sure `git lfs` is installed before cloning; Renovate keeps both the Ignition image and the module version up to date automatically.

## Prerequisites

- Docker and Docker Compose
- Git LFS (for the bundled Flint Designer Bridge module)
- Traefik proxy (for subdomain access) or use localhost ports

## Local Development

The gateway is configured with:
- Quickstart disabled
- EULA automatically accepted
- A local development deployment mode enabled (`-Dignition.config.mode=local-dev`)
- Commissioning skipped

## File Structure

```
├── services/
│   ├── ignition/           # Gateway configuration, projects, and modules
│   ├── postgres/           # Database setup and migrations
│   └── pgadmin/            # pgAdmin configuration
├── flint.config.json       # Flint VS Code extension configuration
└── docker-compose.yaml     # Main service definitions
```

## Customization

- Modify `docker-compose.yaml` to add/remove modules by using the `GATEWAY_MODULES_ENABLED` environment variable.
- Update database credentials in the compose file
- Add your projects to `services/ignition/projects/`
- Configure gateway settings in `services/ignition/config/`