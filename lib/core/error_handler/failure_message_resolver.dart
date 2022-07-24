import 'package:flutter/widgets.dart';
import 'package:zapify/core/error_handler/error_message_resolver.dart';
import 'package:zapify/core/error_handler/failure.dart';

class FailureErrorMessageResolver extends ErrorMessageResolver {
  @override
  String? maybeResolve(BuildContext context, error) {
    if (error is Failure) {
      return error.message(context);
    }
    return null;
  }
}
