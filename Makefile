.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo "Makefile Commands:"
	@echo "----------------------------------------------------------------"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
	@echo "----------------------------------------------------------------"

bench: ## run benchmarks
	go test -v -race -bench BenchmarkDagger -run==

test: ## run unit tests
	go test -cover -v -coverprofile cover.out -race .

coverage: ## show test coverage
	go tool cover -func cover.out