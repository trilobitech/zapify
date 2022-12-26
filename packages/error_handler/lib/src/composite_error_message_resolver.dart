import 'package:flutter/widgets.dart';
import 'package:logger_plus/logger_plus.dart';

import 'error_message_resolver.dart';
import 'failure.dart';
import 'failure_message_resolver.dart';

class CompositeErrorMessageResolver extends ErrorMessageResolver {
  CompositeErrorMessageResolver({
    OnUnknownError? onUnknownError,
    List<ErrorMessageResolver> resolvers = const [],
  }) : _resolvers = {
          FailureErrorMessageResolver(),
          ...resolvers,
          UnknowErrorResolver(onUnknownError),
        };

  final Set<ErrorMessageResolver> _resolvers;

  @override
  ResolvedFailure? maybeResolve(BuildContext context, dynamic error) {
    if (error == null) {
      return null;
    }

    for (ErrorMessageResolver resolver in _resolvers) {
      ResolvedFailure? message = resolver.maybeResolve(context, error);
      if (message != null) {
        return message;
      }
    }

    Log.e('Resolver not found for: "${error.runtimeType}" -> $error');
    return null;
  }
}
