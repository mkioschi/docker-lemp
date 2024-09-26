# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Infra commands                                                              │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: start
start:
	@docker compose -f .docker/docker-compose.yml --env-file .docker/.env up -d

.PHONY: stop
stop:
	@docker compose -f .docker/docker-compose.yml --env-file .docker/.env down

.PHONY: build
build:
	@docker compose -f .docker/docker-compose.yml --env-file .docker/.env build

.PHONY: exec
exec:
	@docker exec -it php bash

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Help                                                                        │
# └─────────────────────────────────────────────────────────────────────────────┘
help:
	@echo ""
	@echo "Usage:"
	@echo "    make <command>"
	@echo ""
	@echo "Infra commands:"
	@echo "    build               Build all containers"
	@echo "    start               Start all containers"
	@echo "    stop                Stop all containers"
	@echo ""