# Define env variables to use with Flutter's commands
DART_DEFINE := $$(./bin/get-dart-define.sh)

# Define Flutter and Dart command
DART_CMD = dart
FLUTTER_CMD = flutter
ifneq ($(shell command -v fvm),)
DART_CMD = fvm dart
FLUTTER_CMD = fvm flutter
endif


BUILD_ARTIFACT ?= 'apk'
BUILD_TYPE ?= 'debug'


run: ## Run app
	$(FLUTTER_CMD) run $(DART_DEFINE)


build: ## Run app
	$(FLUTTER_CMD) build $(BUILD_ARTIFACT) --$(BUILD_TYPE) $(DART_DEFINE)


codegen: ## Run code generation
	$(FLUTTER_CMD) pub run build_runner build --delete-conflicting-outputs


fix: ## Fix Dart code
	$(DART_CMD) fix --apply && $(FLUTTER_CMD) analyze . && $(FLUTTER_CMD) format .
