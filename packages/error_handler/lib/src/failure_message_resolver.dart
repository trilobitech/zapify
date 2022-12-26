import 'package:flutter/widgets.dart';

import 'error_message_resolver.dart';
import 'failure.dart';

class FailureErrorMessageResolver extends ErrorMessageResolver {
  @override
  ResolvedFailure? maybeResolve(BuildContext context, error) {
    if (error is Failure) {
      return error.resolve(context);
    }
    return null;
  }
}
