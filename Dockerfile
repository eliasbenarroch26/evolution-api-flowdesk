FROM atendai/evolution-api:v2.2.3

RUN printf '#!/bin/sh\nset -e\nDB="${DATABASE_CONNECTION_URI:-${DATABASE_URL}}"\n# Buscar donde esta el .env interno\nENV_PATH=$(find / -name ".env" -not -path "*/proc/*" 2>/dev/null | head -1)\necho "==> .env encontrado en: ${ENV_PATH}"\necho "==> Directorio app: $(dirname ${ENV_PATH})"\nls $(dirname ${ENV_PATH})\nexec "$@"\n' > /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["npm", "run", "start:prod"]
