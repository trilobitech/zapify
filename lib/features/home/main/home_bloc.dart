import 'package:analytics/analytics.dart';
import 'package:flutter/services.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:receive_intent/receive_intent.dart';
import 'package:state_action_bloc/state_action_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/domain/error.dart';
import '../../../common/ext/string.dart';
import '../../call_log/call_log_mediator.dart';
import '../../history/domain/usecase/save_phone_number_history.dart';
import '../../history/history_mediator.dart';
import '../../region/domain/entity/region.dart';
import '../../region/region_mediator.dart';
import '../chat_apps/chat_apps_mediator.dart';
import '../chat_apps/domain/exception/open_chat_app_error.dart';
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
    required IAnalytics analytics,
  })  : _phoneFieldComponent = phoneFieldComponent,
        _savePhoneNumberHistory = savePhoneNumberHistory,
        _analytics = analytics;

  final SavePhoneNumberHistoryUseCase _savePhoneNumberHistory;
  final PhoneFieldComponent _phoneFieldComponent;
  final IAnalytics _analytics;

  void onIntentReceived(Intent intent) async {
    final phoneNumber = intent.data;
    if (phoneNumber != null && phoneNumber.startsWith('tel:')) {
      _analytics.intentHandled('phone_number_received');

      await _phoneFieldComponent
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
    _analytics.buttonPressed('open_region_picker');
    _phoneFieldComponent.unfocusField();
    sendAction(HomeAction.navigateToRegionPicker(selectedCode));
  }

  @override
  Future<void> onRegionSelected(IRegion region) =>
      _phoneFieldComponent.updateRegion(region);

  @override
  Future<void> launch(String uriTemplate) async {
    try {
      final phoneNumber = await _phoneFieldComponent.getPhoneNumber();

      final uri = uriTemplate.formatWithMap({
        'phoneNumber': phoneNumber.e164.replaceFirst('+', ''),
      });

      final successful = await launchUrl(
        Uri.parse(uri),
        mode: LaunchMode.externalApplication,
      );

      if (!successful) {
        throw ChatAppNotFoundError('Failed to launch $uriTemplate');
      }

      await _savePhoneNumberHistory(phoneNumber: phoneNumber.international);

      _phoneFieldComponent.clearField();
    } on PlatformException catch (e) {
      if (e.code == 'ACTIVITY_NOT_FOUND') {
        throw ChatAppNotFoundError(e.message);
      }
      rethrow;
    } on NonReportableError {
      // ignore already handled errors
    }
  }
}
