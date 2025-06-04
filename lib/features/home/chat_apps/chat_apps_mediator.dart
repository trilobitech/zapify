import 'dart:async';

import '../phone/domain/entities/phone_number.dart';

abstract class ChatAppsMediator {
  Future<void> launch({
    required String uriTemplate,
    required PhoneNumberValue? phoneNumber,
  });
}
