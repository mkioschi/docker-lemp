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
.PHONY: start
start:
	@docker-compose -f .docker/docker-compose.yml --env-file .docker/.env up -d

.PHONY: stop
stop:
	@docker-compose -f .docker/docker-compose.yml --env-file .docker/.env down

.PHONY: build
build:
	@docker-compose -f .docker/docker-compose.yml --env-file .docker/.env build

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
	@echo "${CG}   start               ${RC}Start all containers"
	@echo "${CG}   stop                ${RC}Stop all containers"
	@echo ""