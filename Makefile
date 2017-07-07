.DEFAULT_GOAL := help

PROJECT_NAME := BETALOTEST API

.PHONY: help
help:
	@echo "------------------------------------------------------------------------"
	@echo "${PROJECT_NAME}"
	@echo "------------------------------------------------------------------------"
	@grep -E '^[a-zA-Z0-9_/%\-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: test
test: ## run api unit tests
	@docker-compose up --build test

.PHONY: publish
publish: ## publish images on docker hub
	@docker-compose build api stub_api nginx
	@docker push alesr/betalo-api alesr/betalo-stub_api alesr/betalo-nginx

.PHONY: run
run: ## start api, stub_api and nginx as reverse proxy
	@docker-compose build api spec stub_api
	@docker-compose up -d --build nginx

.PHONY: stop
stop: ## stop and remove services containers
	@docker-compose rm -fsv nginx api spec stub_api

.PHONY: editor/run
editor/run: ## start swagger editor container
	@docker-compose up -d editor

.PHONY: editor/stop
editor/stop: ## stop and remove swagger editor container
	@docker-compose rm -fsv editor