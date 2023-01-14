import 'package:flutter/widgets.dart';

import 'converter.dart';
import 'failure.dart';
import 'registry.dart';

class FailureAdapter {
  const FailureAdapter({
    required this.fallback,
    this.registry,
  });

  final ErrorConverter fallback;
  final ErrorConverterRegistry? registry;

  Failure? maybeAdapt(BuildContext context, Object? error) {
    if (error == null) return null;
    return adapt(context, error);
  }

  Failure adapt(BuildContext context, Object error) {
    final registry = this.registry;
    ErrorConverter convertError = fallback;

    if (registry != null && registry.hasConverterFor(error)) {
      convertError = registry.getConverterFor(error);
    }

    return convertError(context, error);
  }
}
