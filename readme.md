# Ignition 8.3 + PostgreSQL Template

A Docker Compose template for quickly setting up an Ignition 8.3 gateway with PostgreSQL database and optional pgAdmin for development.

## Quick Start

1. **Initialize submodules:**
   ```bash
   git submodule update --init --recursive
   ```

2. **Start the services:**
   ```bash
   docker compose up -d
   ```

3. **Access the gateway:**
   - Ignition Gateway: https://ignition83.localtest.me (requires Traefik proxy)
   - Or direct access: http://localhost:8088

## What's Included

- **Ignition 8.3.0-rc1** with Standard Edition
- **PostgreSQL** database with Liquibase migrations
- **pgAdmin** for database management
- **Traefik** integration for local development
- **Gateway Utilities** project (via git submodule)

### Pre-enabled Modules

- Event Stream
- Historian
- Perspective
- PostgreSQL Driver
- Web Development
- OPC UA

## Services

| Service | Description | Access |
|---------|-------------|---------|
| gateway | Ignition 8.3 Gateway | https://ignition83.localtest.me |
| database | PostgreSQL 16 | localhost:5432 |
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

## Prerequisites

- Docker and Docker Compose
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
│   ├── ignition/           # Gateway configuration and projects
│   ├── postgres/           # Database setup and migrations
│   └── pgadmin/           # pgAdmin configuration
├── shared/
│   └── gateway-utilities/  # Shared utilities project (submodule)
└── docker-compose.yaml    # Main service definitions
```

## Customization

- Modify `docker-compose.yaml` to add/remove modules
- Update database credentials in the compose file
- Add your projects to `services/ignition/projects/`
- Configure gateway settings in `services/ignition/config/`