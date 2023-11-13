import 'package:error_adapter/error_adapter.dart';
import 'package:resources/strings.dart';

import '../../../common/widgets/feedback_view.dart';
import '../domain/exception/no_call_log_access_permission.dart';

class CallLogErrorConverterRegistry extends ErrorConverterRegistry {
  CallLogErrorConverterRegistry() {
    on<NoCallLogAccessPermissionError>(
      (context, _) => ErrorFeedback(
        message: context.strings.callLogPermissionMessage,
        primaryButtonText: context.strings.callLogPermissionButtonLabel,
      ),
    );
  }
}
