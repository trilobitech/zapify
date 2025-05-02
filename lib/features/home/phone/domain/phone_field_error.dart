import '../../../../../common/domain/error.dart';

class EmptyPhoneNumberError extends NonReportableError {}

class InvalidPhoneNumberError extends Error {
  InvalidPhoneNumberError([this.message]);

  final String? message;

  @override
  String toString() {
    return 'InvalidPhoneNumberError{message: $message}';
  }
}
