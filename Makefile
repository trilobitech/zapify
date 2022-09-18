SHELL := /bin/bash
UNAME_S := $(shell uname)

ifneq ("$(wildcard .env)","")
include .env
export $(shell grep -e '^[^\#;]' .env | sed 's/[?:]\?=.*//')
endif

help: ## Show this help
	@echo -e "usage: make [target]\n\ntarget:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/: ##\s*/\t/' | expand -t 18 | pr -to2
  

run: ## Run app
	fvm flutter run

codegen: ## Run code generation
	fvm flutter pub run build_runner build --delete-conflicting-outputs

release: ## Generate applications package
	fvm flutter build appbundle --release

phony: ## Create .PHONY section in this file (look https://stackoverflow.com/a/2145605)
ifeq ($(UNAME_S),Linux)
	sed -i '/^\.PHONY/d' Makefile
endif
ifeq ($(UNAME_S),Darwin)
	sed -i '' '/^\.PHONY/d' Makefile
endif
	echo -n .PHONY: `fgrep -h "##" Makefile | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/:.*//' | paste -sd " " -` >> Makefile

ifndef VERBOSE
.SILENT:
endif

.PHONY: help run codegen release phony