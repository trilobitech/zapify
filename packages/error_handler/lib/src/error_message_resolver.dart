import 'package:flutter/widgets.dart';

import 'failure.dart';

typedef OnUnknownError = ResolvedFailure Function(BuildContext context);

abstract class ErrorMessageResolver {
  ResolvedFailure? maybeResolve(BuildContext context, dynamic error);

  ResolvedFailure resolve(BuildContext context, dynamic error) {
    ResolvedFailure? failure = maybeResolve(context, error);
    if (failure == null) {
      throw UnsupportedError(
        'Resolver not found for: "${error.runtimeType}" -> $error',
      );
    }
    return failure;
  }
}

class UnknowErrorResolver extends ErrorMessageResolver {
  UnknowErrorResolver(this._onUnknownError);

  final OnUnknownError? _onUnknownError;

  @override
  ResolvedFailure? maybeResolve(BuildContext context, error) =>
      _onUnknownError?.call(context);
}
