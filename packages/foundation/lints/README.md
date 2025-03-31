# foundation_lints

This package provides a set of lint rules to be used by other packages in the project. It ensures code quality and consistency across the project.

## Installation

Add `foundation_lints` as a dependency in your `pubspec.yaml` file:

```yaml
dev_dependencies:
  foundation_lints: ^0.1.0
```

## Usage

Include the lint rules in your `analysis_options.yaml` file:

```yaml
include: package:foundation_lints/flutter.yaml
```

Or for Dart-only projects:

```yaml
include: package:foundation_lints/dart.yaml
```

## Lint Rules

The following lint rules are included in this package:

- `always_declare_return_types`
- `avoid_shadowing_type_parameters`
- `cancel_subscriptions`
- `close_sinks`
- `directives_ordering`
- `discarded_futures`
- `implicit_call_tearoffs`
- `join_return_with_assignment`
- `only_throw_errors`
- `prefer_const_constructors`
- `prefer_final_in_for_each`
- `prefer_relative_imports`
- `prefer_single_quotes`
- `require_trailing_commas` (temporarily disabled)
- `sort_constructors_first`
- `sort_child_properties_last`

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for version history.
