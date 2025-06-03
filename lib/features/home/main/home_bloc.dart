import 'dart:async';
import 'dart:io';

import 'package:analytics/analytics.dart';
import 'package:flutter/services.dart';
import 'package:logify/logify.dart';
import 'package:rxdart/rxdart.dart';
import 'package:state_action_bloc/state_action_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/config/local_config.dart';
import '../../../common/domain/error.dart';
import '../../../common/ext/stream.dart';
import '../../../common/ext/string.dart';
import '../../../common/services/share_service.dart';
import '../../call_log/call_log_mediator.dart';
import '../../chat_app/domain/exception/chat_app_not_found_error.dart';
import '../../history/domain/entity/history.dart';
import '../../history/domain/usecase/save_phone_number_history.dart';
import '../../history/history_mediator.dart';
import '../../region/domain/entity/region.dart';
import '../../region/region_mediator.dart';
import '../chat_apps/chat_apps_mediator.dart';
import '../phone/domain/entities/phone_number.dart';
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
  }) : _phoneFieldComponent = phoneFieldComponent,
       _savePhoneNumberHistory = savePhoneNumberHistory,
       _analytics = analytics;

  final SavePhoneNumberHistoryUseCase _savePhoneNumberHistory;
  final PhoneFieldComponent _phoneFieldComponent;
  final IAnalytics _analytics;
  final CompositeSubscription _subscriptions = CompositeSubscription();

  late final _shareService = ShareService();

  void onInit() {
    _subscriptions.addAll([
      if (Platform.isAndroid) _shareService.stream().listen(_onIntentReceived),
      LocalConfig.isFirstOpen.watch<bool>().listen(_displayWelcomeMessage),
    ]);
  }

  void dispose() async {
    _subscriptions.dispose();
  }

  void _displayWelcomeMessage(bool isFirstOpen) {
    if (!isFirstOpen) return;
    sendAction(HomeAction.showWelcomeMessage());
  }

  void onWelcomeMessageClosed() async {
    await LocalConfig.isFirstOpen.set(false);
  }

  void _onIntentReceived(Intent intent) async {
    final phoneNumber = intent.data;
    if (phoneNumber != null && phoneNumber.startsWith('tel:')) {
      _analytics.intentHandled('phone_number_received');

      await _phoneFieldComponent
          .updatePhoneFromText(phoneNumber.replaceFirst('tel:', ''))
          .catchError((_) {
            final obfuscatedNumber = phoneNumber
                .replaceAll('*', '\\*')
                .replaceAll(RegExp('[0-9]'), '*');
            Log.e('invalid phone number: $obfuscatedNumber');
          });
    }
  }

  @override
  Future<void> onPhoneReceivedFromCallLog(String phoneNumber) =>
      _phoneFieldComponent.updatePhoneFromText(phoneNumber);

  @override
  Future<void> onPhoneReceivedFromHistory(HistoryEntry entry) =>
      _phoneFieldComponent.updatePhoneFromHistoric(entry);

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
  Future<void> launch({
    required String uriTemplate,
    required PhoneNumberValue? phoneNumber,
  }) async {
    try {
      phoneNumber ??= await _phoneFieldComponent.getPhoneNumber();

      final uri = uriTemplate.formatWithMap({'phoneNumber': phoneNumber.raw});

      final successful = await launchUrl(
        Uri.parse(uri),
        mode: LaunchMode.externalApplication,
      );

      if (!successful) {
        throw ChatAppNotFoundError('Failed to launch $uriTemplate');
      }

      await _savePhoneNumberHistory(phoneNumber: phoneNumber.formatted);

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
