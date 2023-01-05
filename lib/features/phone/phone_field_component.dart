import 'package:phone_number/phone_number.dart';

import '../region/domain/entity/region.dart';

abstract class PhoneFieldComponent {
  Future<PhoneNumber> getPhoneNumber();

  Future<void> updatePhoneField({
    String? phone,
    Region? region,
    bool showKeyboard = false,
  });

  void unfocusField();

  void clearField();
}
