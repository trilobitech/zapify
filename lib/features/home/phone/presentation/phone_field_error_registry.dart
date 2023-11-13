import 'package:error_adapter/error_adapter.dart';
import 'package:resources/strings.dart';

import '../domain/phone_field_error.dart';

class PhoneFieldErrorConverterRegistry extends ErrorConverterRegistry {
  PhoneFieldErrorConverterRegistry() {
    on<EmptyPhoneNumberError>(
      (context, _) => MessageFailure(
        context.strings.homeEmptyPhoneNumberError,
      ),
    );

    on<InvalidPhoneNumberError>(
      (context, _) => MessageFailure(
        context.strings.homeInvalidPhoneNumberError,
      ),
    );
  }
}
