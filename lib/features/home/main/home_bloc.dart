import 'package:analytics/analytics.dart';
import 'package:bloc_plus/bloc_plus.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:receive_intent/receive_intent.dart';

import '../../../common/domain/error.dart';
import '../../call_log/call_log_mediator.dart';
import '../../history/domain/usecase/save_phone_number_history.dart';
import '../../history/history_mediator.dart';
import '../../region/domain/entity/region.dart';
import '../../region/region_mediator.dart';
import '../chat_apps/chat_apps_mediator.dart';
import '../phone/phone_field_component.dart';
import 'home_state.dart';

abstract class HomeMediator
    implements
        RegionMediator,
        ChatAppsMediator,
        HistoryMediator,
        CallLogMediator {}

class HomeBloc extends ActionBloc<HomeAction> implements HomeMediator {
  HomeBloc({
    required PhoneFieldComponent phoneFieldComponent,
    required SavePhoneNumberHistoryUseCase savePhoneNumberHistory,
  })  : _phoneFieldComponent = phoneFieldComponent,
        _savePhoneNumberHistory = savePhoneNumberHistory;

  final SavePhoneNumberHistoryUseCase _savePhoneNumberHistory;

  final PhoneFieldComponent _phoneFieldComponent;

  Future<void> onIntentReceived(Intent intent) async {
    final phoneNumber = intent.data;
    if (phoneNumber != null && phoneNumber.startsWith('tel:')) {
      analytics.intentHandled('phone_number_received');

      _phoneFieldComponent
          .updatePhone(phoneNumber.replaceFirst('tel:', ''))
          .catchError((_) {
        final obfuscatedNumber =
            phoneNumber.replaceAll('*', '\\*').replaceAll(RegExp('[0-9]'), '*');
        Log.e('invalid phone number: $obfuscatedNumber');
      });
    }
  }

  @override
  Future<void> onPhoneReceivedFromCallLog(String phoneNumber) =>
      _phoneFieldComponent.updatePhone(phoneNumber);

  @override
  Future<void> onPhoneReceivedFromHistory(String phoneNumber) =>
      _phoneFieldComponent.updatePhone(phoneNumber);

  @override
  void showRegionPicker(RegionCode? selectedCode) {
    analytics.buttonPressed('open_region_picker');
    _phoneFieldComponent.unfocusField();
    sendAction(HomeAction.navigateToRegionPicker(selectedCode));
  }

  @override
  Future<void> onRegionSelected(IRegion region) =>
      _phoneFieldComponent.updateRegion(region);

  @override
  Future<void> launch(ChatAppLauncher launcher) async {
    try {
      final phoneNumber = await _phoneFieldComponent.getPhoneNumber();

      await launcher(phoneNumber.e164.replaceFirst('+', ''));
      await _savePhoneNumberHistory(phoneNumber: phoneNumber.international);

      _phoneFieldComponent.clearField();
    } on NonReportableError {
      // ignore already handled errors
    }
  }
}
