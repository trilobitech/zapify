import '../../history/domain/entity/history.dart';
import '../../region/domain/entity/region.dart';
import 'domain/entities/phone_number.dart';

abstract class PhoneFieldComponent {
  Future<PhoneNumberValue> getPhoneNumber();

  Future<void> updatePhoneFromHistoric(HistoryEntry entry);

  Future<void> updatePhoneFromText(String phone);

  Future<void> updateRegion(IRegion region);

  void requestFieldFocus();

  void unfocusField();

  void clearField();
}
