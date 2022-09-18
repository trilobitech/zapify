SHELL := /bin/bash

help: ## Show this help
	@echo -e "usage: make [target]\n\ntarget:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/: ##\s*/\t/' | expand -t 18 | pr -to2
  

run: ## Run app
	fvm flutter run

codegen: ## Run code generation
	fvm flutter pub run build_runner build --delete-conflicting-outputs

phony: ## Create .PHONY section in this file (look https://stackoverflow.com/a/2145605)
	sed -i '' '/^\.PHONY/d' Makefile
	echo -n .PHONY: `fgrep -h "##" Makefile | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/:.*//' | paste -sd " " -` >> Makefile

ifndef VERBOSE
.SILENT:
endif

.PHONY: help run codegen phony