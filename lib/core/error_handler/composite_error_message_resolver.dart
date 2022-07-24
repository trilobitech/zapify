import 'package:flutter/widgets.dart';
import 'package:zapify/core/error_handler/error_message_resolver.dart';
import 'package:zapify/core/error_handler/failure_message_resolver.dart';
import 'package:zapify/core/ext/context.dart';
import 'package:zapify/core/logger.dart';

class CompositeErrorMessageResolver extends ErrorMessageResolver {
  CompositeErrorMessageResolver([
    List<ErrorMessageResolver> resolvers = const [],
  ]) : _resolvers = {FailureErrorMessageResolver(), ...resolvers};

  final Set<ErrorMessageResolver> _resolvers;

  @override
  String? maybeResolve(BuildContext context, dynamic error) {
    if (error == null) {
      return null;
    }

    for (ErrorMessageResolver resolver in _resolvers) {
      String? message = resolver.maybeResolve(context, error);
      if (message != null) {
        return message;
      }
    }

    logError('Resolver not found for: "${error.runtimeType}" -> $error');

    return context.strings.unknowErrorMessage;
  }
}
