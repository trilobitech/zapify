# Define env variables to use with Flutter's commands
DART_DEFINE := $$(./bin/get-dart-define.sh)

# Define Flutter and Dart command
DART_CMD = dart
FLUTTER_CMD = flutter
ifneq ($(shell command -v fvm),)
DART_CMD = fvm dart
FLUTTER_CMD = fvm flutter
endif


run: ## Run app
	$(DART_CMD) run flutter_toolkit:cli run-app


codegen: ## Run code generation
	$(FLUTTER_CMD) pub run build_runner build --delete-conflicting-outputs
