import 'package:error_handler/error_handler.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/ext/context.dart';

class NoCallLogAccessPermission extends ActionableFailure {
  @override
  String action(BuildContext context) =>
      context.strings.callLogPermissionButtonLabel;

  @override
  String message(BuildContext context) =>
      context.strings.callLogPermissionMessage;
}
