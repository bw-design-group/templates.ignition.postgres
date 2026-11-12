# Ignition 2027 + PostgreSQL Template

A Docker Compose template for quickly setting up an Ignition 2027 gateway with PostgreSQL database and optional pgAdmin for development.

> **Beta.** The gateway runs `inductiveautomation/ignition:2027.2.0-beta1`, the public Ignition 2027 beta. Do not use it for production.

## Quick Start

1. **Start the services:**
   ```bash
   docker compose up -d
   ```

2. **Access the gateway:**
   - Ignition Gateway: https://ignition2027.localtest.me (requires Traefik proxy)
   - Or direct access: http://localhost:8088

## What's Included

- **Ignition 2027.2.0-beta1** with Standard Edition
- **PostgreSQL** database with Liquibase migrations
- **pgAdmin** for database management
- **Traefik** integration for local development

## Services

| Service | Description | Access |
|---------|-------------|---------|
| gateway | Ignition 2027 Gateway | https://ignition2027.localtest.me |
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
│   └── pgadmin/            # pgAdmin configuration
└── docker-compose.yaml     # Main service definitions
```

## Customization

- Modify `docker-compose.yaml` to add/remove modules by using the `GATEWAY_MODULES_ENABLED` environment variable.
- Update database credentials in the compose file
- Add your projects to `services/ignition/projects/`
- Configure gateway settings in `services/ignition/config/`
