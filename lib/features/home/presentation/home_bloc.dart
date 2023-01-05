import 'package:analytics/analytics.dart';
import 'package:error_handler/error_handler.dart';

import '../../../common/arch/bloc_controller.dart';
import '../../call_log/call_log_mediator.dart';
import '../../history/domain/usecase/save_phone_number_history.dart';
import '../../history/history_mediator.dart';
import '../../region/domain/entity/region.dart';
import '../../region/region_mediator.dart';
import '../components/chat_apps/chat_apps_mediator.dart';
import '../components/phone/phone_field_component.dart';
import 'home_state.dart';

abstract class HomeMediator
    implements
        RegionMediator,
        ChatAppsMediator,
        HistoryMediator,
        CallLogMediator {}

class HomeBloc extends BlocController<HomeEvent, void> implements HomeMediator {
  HomeBloc({
    required PhoneFieldComponent phoneFieldComponent,
    required SavePhoneNumberHistoryUseCase savePhoneNumberHistory,
  })  : _phoneFieldComponent = phoneFieldComponent,
        _savePhoneNumberHistory = savePhoneNumberHistory,
        super(null);

  final SavePhoneNumberHistoryUseCase _savePhoneNumberHistory;

  final PhoneFieldComponent _phoneFieldComponent;

  Future<void> onPhoneReceivedFromIntent(String phoneNumber) =>
      _phoneFieldComponent.updatePhoneField(phone: phoneNumber);

  @override
  void onPhoneReceivedFromCallLog(String phoneNumber) {
    _phoneFieldComponent.updatePhoneField(phone: phoneNumber);
  }

  @override
  void onPhoneReceivedFromHistory(String phoneNumber) {
    _phoneFieldComponent.updatePhoneField(phone: phoneNumber);
  }

  @override
  void showRegionPicker(Region region) {
    analytics.buttonPressed('open_region_picker');
    _phoneFieldComponent.unfocusField();
    event(HomeEvent.navigateToRegionPicker(region));
  }

  @override
  void onRegionSelected(Region region) {
    _phoneFieldComponent.updatePhoneField(region: region, showKeyboard: true);
  }

  @override
  Future<void> launch(ChatAppLauncher launcher) async {
    try {
      final phoneNumber = await _phoneFieldComponent.getPhoneNumber();

      await launcher(phoneNumber.e164.replaceFirst('+', ''));
      await _savePhoneNumberHistory(phoneNumber: phoneNumber.international);

      _phoneFieldComponent.clearField();
    } on Failure {
      // ignore already handled errors
    }
  }
}
