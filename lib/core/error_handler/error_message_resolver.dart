import 'package:flutter/widgets.dart';

abstract class ErrorMessageResolver {
  String? maybeResolve(BuildContext context, dynamic error);

  String resolve(BuildContext context, dynamic error) {
    return maybeResolve(context, error)!;
  }
}
