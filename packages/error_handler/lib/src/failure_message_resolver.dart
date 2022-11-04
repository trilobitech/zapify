import 'package:flutter/widgets.dart';

import 'error_message_resolver.dart';
import 'failure.dart';

class FailureErrorMessageResolver extends ErrorMessageResolver {
  @override
  String? maybeResolve(BuildContext context, error) {
    if (error is Failure) {
      return error.message(context);
    }
    return null;
  }
}
