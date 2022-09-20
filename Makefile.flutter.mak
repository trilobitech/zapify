# Define env variables to use with Flutter's commands
APP_PREFIX := $(shell grep 'name:' pubspec.yaml | tail -n1 | awk '{ print $$2}')
DART_DEFINE := $$(env | grep -i '^$(APP_PREFIX)_' | sed -e 's/^/--dart-define /')

FLUTTER_CMD=flutter
ifeq ($(shell command -v fvm),"")
FLUTTER_CMD := fvm flutter
endif


run: ## Run app
	$(FLUTTER_CMD) run $(DART_DEFINE)


codegen: ## Run code generation
	$(FLUTTER_CMD) pub run build_runner build --delete-conflicting-outputs


release: ## Generate applications package
	$(FLUTTER_CMD) build appbundle --release $(DART_DEFINE)