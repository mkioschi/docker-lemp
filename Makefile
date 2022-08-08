# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Colors definitions                                                          │
# └─────────────────────────────────────────────────────────────────────────────┘
CR=\033[0;31m
CG=\033[0;32m
CY=\033[0;33m
CB=\033[0;36m
RC=\033[0m

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Infra commands                                                              │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: start-development
start-development:
	@docker-compose -f .docker/development/docker-compose.yml --env-file .docker/development/.env up -d

.PHONY: stop-development
stop-development:
	@docker-compose -f .docker/development/docker-compose.yml --env-file .docker/development/.env down

.PHONY: build-development
build-development:
	@docker-compose -f .docker/development/docker-compose.yml --env-file .docker/development/.env build

.PHONY: start-staging
start-staging:
	@docker-compose -f .docker/staging/docker-compose.yml --env-file .docker/staging/.env up -d

.PHONY: stop-staging
stop-staging:
	@docker-compose -f .docker/staging/docker-compose.yml --env-file .docker/staging/.env down

.PHONY: build-staging
build-staging:
	@docker-compose -f .docker/staging/docker-compose.yml --env-file .docker/staging/.env build

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Help                                                                        │
# └─────────────────────────────────────────────────────────────────────────────┘
help:
	@echo ""
	@echo "${CY}Usage:${RC}"
	@echo "   make ${CG}<command>${RC}"
	@echo ""
	@echo "${CY}Infra commands:${RC}"
	@echo "${CG}   build               ${RC}Build all containers"
	@echo "${CG}   clear-logs          ${RC}Clear application logs"
	@echo "${CG}   down                ${RC}Stop all containers"
	@echo "${CG}   up                  ${RC}Start all containers"
	@echo ""