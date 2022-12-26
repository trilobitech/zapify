import 'package:flutter/widgets.dart';

abstract class Failure implements Exception {
  String message(BuildContext context);

  ResolvedFailure resolve(BuildContext context) =>
      ResolvedFailure(message: message(context));
}

abstract class ActionableFailure extends Failure {
  String action(BuildContext context);

  @override
  ResolvedActionableFailure resolve(BuildContext context) =>
      ResolvedActionableFailure(
        message: message(context),
        action: action(context),
      );
}

class ResolvedFailure {
  ResolvedFailure({
    required this.message,
  });

  final String message;
}

class ResolvedActionableFailure extends ResolvedFailure {
  ResolvedActionableFailure({
    required super.message,
    required this.action,
  });

  final String action;
}
