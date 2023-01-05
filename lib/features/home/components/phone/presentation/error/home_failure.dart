import 'package:error_handler/error_handler.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../common/ext/context.dart';

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
