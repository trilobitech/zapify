import '../../../../../common/domain/error.dart';
import 'entities/phone_number.dart';

class EmptyPhoneNumberError extends NonReportableError {}

class InvalidPhoneNumberError extends Error {
  InvalidPhoneNumberError([this.message]);

  final String? message;

  @override
  String toString() {
    return 'InvalidPhoneNumberError{message: $message}';
  }
}

class MaybeInvalidPhoneNumberError extends Error {
  MaybeInvalidPhoneNumberError(this.phoneNumber);

  final PhoneNumberValue phoneNumber;

  @override
  String toString() =>
      'MaybeInvalidPhoneNumberError{phoneNumber: $phoneNumber}';
}
