import 'package:phone_number/phone_number.dart';

import '../../region/domain/entity/region.dart';

abstract class PhoneFieldComponent {
  Future<PhoneNumber> getPhoneNumber();

  Future<void> updatePhone(String phone);

  Future<void> updateRegion(IRegion region);

  void unfocusField();

  void clearField();
}
