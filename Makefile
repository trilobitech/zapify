# region setup environment
SHELL := /bin/bash

# Define environment variables
ENV_FILES := $(wildcard .env.default .env)
ifneq ($(ENV_FILES),)
include $(ENV_FILES)
export $(shell grep -he '^[^\#;]' $(ENV_FILES) | sed 's/=.*//' | sort | uniq)
endif

# Make sed portable with macOS
SED_CMD = sed -i
ifeq ($(shell uname),Darwin)
SED_CMD = sed -i ''
endif

MAK_FILES := $(wildcard bin/mak/*.mak)
ifneq ($(MAK_FILES),)
include $(MAK_FILES)
endif
# endregion



help: ## Show this help
	@echo -e "usage: make [target]\n\ntarget:"
	@grep -F -h "##" $(MAKEFILE_LIST) | grep -F -v grep | sed -e 's/\\$$//' | sed -e 's/: ##\s*/\t/' | expand -t 22 | pr -to2


phony: ## Create .PHONY section in this file (look https://stackoverflow.com/a/2145605)
	$(SED_CMD) -e "s/^\.PHONY:.*$$/.PHONY: `grep -hE '^\w+:' $(MAKEFILE_LIST) | grep -F -v grep | sed -e 's/:.*//' | uniq | paste -sd \" \" -`/g" Makefile



ifndef VERBOSE
.SILENT:
endif

.PHONY: help phony run build codegen fix serve_page setup_google_services bump_version
