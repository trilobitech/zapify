import 'package:flutter/material.dart';
import 'package:zapify/core/error_handler/failure.dart';
import 'package:zapify/core/ext/context.dart';

class EmptyPhoneNumberFailure extends Failure {
  @override
  String message(BuildContext context) =>
      context.strings.homeEmptyPhoneNumberError;
}

class InvalidPhoneNumberFailure extends Failure {
  @override
  String message(BuildContext context) =>
      context.strings.homeInvalidPhoneNumberError;
}
