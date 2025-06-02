import 'package:phone_number/phone_number.dart';

import '../../history/domain/entity/history.dart';
import '../../region/domain/entity/region.dart';

abstract class PhoneFieldComponent {
  Future<PhoneNumber> getPhoneNumber();

  Future<void> updatePhoneFromHistoric(HistoryEntry entry);

  Future<void> updatePhoneFromText(String phone);

  Future<void> updateRegion(IRegion region);

  void requestFieldFocus();

  void unfocusField();

  void clearField();
}
