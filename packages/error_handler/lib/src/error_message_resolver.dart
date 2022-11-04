import 'package:flutter/widgets.dart';

typedef OnUnknownError = String Function(BuildContext context);

abstract class ErrorMessageResolver {
  String? maybeResolve(BuildContext context, dynamic error);

  String resolve(BuildContext context, dynamic error) {
    String? message = maybeResolve(context, error);
    if (message == null) {
      throw UnsupportedError(
        'Resolver not found for: "${error.runtimeType}" -> $error',
      );
    }
    return message;
  }
}

class UnknowErrorResolver extends ErrorMessageResolver {
  UnknowErrorResolver(this._onUnknownError);

  final OnUnknownError? _onUnknownError;

  @override
  String? maybeResolve(BuildContext context, error) =>
      _onUnknownError?.call(context);
}
