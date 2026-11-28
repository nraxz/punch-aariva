#!/usr/bin/env bash
set -euo pipefail

# --------------------------------------------------------------------------------
# Start Aariva Punch in Docker (MySQL + Apache image).
# On first boot the container entrypoint runs kimai:install and creates the admin.
# --------------------------------------------------------------------------------

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${ROOT_DIR}"

ENV_FILE="${ROOT_DIR}/.env.docker"
ENV_DIST="${ROOT_DIR}/.env.docker.dist"
COMPOSE=(docker compose --env-file "${ENV_FILE}")

if ! command -v docker >/dev/null 2>&1; then
  echo "Error: docker is not installed or not in PATH." >&2
  exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
  echo "Error: Docker Compose plugin is required (docker compose)." >&2
  exit 1
fi

if [[ ! -f "${ENV_FILE}" ]]; then
  if [[ ! -f "${ENV_DIST}" ]]; then
    echo "Error: missing ${ENV_DIST}" >&2
    exit 1
  fi
  cp "${ENV_DIST}" "${ENV_FILE}"
  echo "Created ${ENV_FILE} from .env.docker.dist (edit credentials before production use)."
fi

env_value() {
  local key="$1"
  local default="$2"
  local value
  value="$(grep -E "^${key}=" "${ENV_FILE}" | tail -n 1 | cut -d= -f2- || true)"
  if [[ -z "${value}" ]]; then
    echo "${default}"
  else
    echo "${value}"
  fi
}

ADMIN_EMAIL="$(env_value ADMIN_EMAIL admin@example.com)"
ADMIN_PASSWORD="$(env_value ADMIN_PASSWORD changeme)"
KIMAI_PORT="$(env_value KIMAI_PORT 8001)"
URL="http://localhost:${KIMAI_PORT}"

echo "Building and starting Aariva Punch ..."
"${COMPOSE[@]}" up -d --build

echo "Waiting for Kimai to become healthy ..."
for _ in $(seq 1 90); do
  if curl -fsS "${URL}" >/dev/null 2>&1; then
    break
  fi
  sleep 2
done

if ! curl -fsS "${URL}" >/dev/null 2>&1; then
  echo "Kimai did not respond at ${URL} yet. Check logs with:"
  echo "  ${COMPOSE[*]} logs -f kimai"
  exit 1
fi

cat <<EOF

Aariva Punch is running.

  URL:      ${URL}
  Username: admin
  Email:    ${ADMIN_EMAIL}
  Password: ${ADMIN_PASSWORD}

Useful commands:
  ${COMPOSE[*]} logs -f kimai
  ${COMPOSE[*]} down
  ${COMPOSE[*]} down -v   # also remove DB/data volumes

EOF
