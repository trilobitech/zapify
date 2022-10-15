# Define env variables to use with Flutter's commands
DART_DEFINE := $$(./scripts/get-dart-define.sh)

FLUTTER_CMD = flutter
ifneq ($(shell command -v fvm),)
FLUTTER_CMD = fvm flutter
endif


run: ## Run app
	@echo $(FLUTTER_CMD) run $(DART_DEFINE)


codegen: ## Run code generation
	$(FLUTTER_CMD) pub run build_runner build --delete-conflicting-outputs


release: ## Generate applications package
	$(FLUTTER_CMD) build appbundle --release $(DART_DEFINE)
