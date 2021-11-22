include .env

ifeq ($(filter $(APP_ENV), local test production),)
$(error Invalid APP_ENV variable. Values accepteds: local, test or production.)
endif

DOCKER_COMPOSE_FILE=docker-compose.$(APP_ENV).yml

ifeq ($(wildcard $(DOCKER_COMPOSE_FILE)),)
$(error $(DOCKER_COMPOSE_FILE) file not found.)
endif

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Colors definitions                                                          │
# └─────────────────────────────────────────────────────────────────────────────┘
CR=\033[0;31m
CG=\033[0;32m
CY=\033[0;33m
CB=\033[0;36m
RC=\033[0m

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ PHP container commands                                                      │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: bash
bash:
	@docker exec -it php bash

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Infra commands                                                              │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: up
up:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

.PHONY: down
down:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

.PHONY: build
build:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) build

.PHONY: restart
restart: down up

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
	@echo "${CG}   down                ${RC}Stop all containers"
	@echo "${CG}   restart             ${RC}Restart all containers"
	@echo "${CG}   up                  ${RC}Start all containers"
	@echo ""
	@echo "${CY}PHP commands:${RC}"
	@echo "${CG}   bash                ${RC}Open a bash terminal inside the PHP container"
	@echo ""
