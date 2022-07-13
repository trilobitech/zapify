import 'package:flutter/material.dart';
import 'package:phone_number/phone_number.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zapfy/core/logger.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';
import 'package:zapfy/features/home/domain/usecase/get_region_by_code.dart';
import 'package:zapfy/features/shared/domain/entity/region.dart';
import 'package:zapfy/features/home/domain/usecase/get_chat_apps.dart';
import 'package:zapfy/features/home/domain/usecase/get_default_region.dart';
import 'package:zapfy/features/home/domain/usecase/save_phone_number_history.dart';
import 'package:zapfy/features/home/presentation/home_state.dart';

class HomeController with _PhoneFieldController, _ChatAppsController {
  HomeController({
    required PhoneNumberUtil plugin,
    required this.getDefaultRegion,
    required this.getRegionByCode,
    required this.getChatApps,
    required this.savePhoneNumberHistory,
  }) : _plugin = plugin {
    init();
  }

  @override
  final PhoneNumberUtil _plugin;

  final GetDefaultRegionUseCase getDefaultRegion;

  @override
  final GetRegionByCode getRegionByCode;

  @override
  final GetChatAppsUseCase getChatApps;

  @override
  final SavePhoneNumberHistoryUseCase savePhoneNumberHistory;

  init() async {
    try {
      final region = await getDefaultRegion();
      onRegionSelected(region);
    } catch (error, stackTrace) {
      logError(error, stackTrace);
    }
  }
}

mixin _PhoneFieldController {
  PhoneNumberUtil get _plugin;
  GetRegionByCode get getRegionByCode;

  TextEditingController _textEditingController = TextEditingController();
  Region _region = Region.br();

  late final BehaviorSubject<PhoneFieldViewState> _phoneFieldState =
      BehaviorSubject.seeded(
    PhoneFieldViewState(
      selectedRegion: _region,
      controller: _textEditingController,
    ),
  );

  Stream<PhoneFieldViewState> phoneFieldState() => _phoneFieldState;

  Future<PhoneNumber> phoneNumber() => _plugin.parse(
        _textEditingController.text,
        regionCode: _region.code,
      );

  onRegionSelected(Region region) {
    _updateTextField(region, _textEditingController.value);
  }

  onPhoneNumberSelected(String phoneNumberString) async {
    final phoneNumber = await _plugin.parse(phoneNumberString);
    final region = await getRegionByCode(phoneNumber.countryCode);
    final formatted =
        await _plugin.format(phoneNumber.nationalNumber, region.code);

    _updateTextField(
      region,
      TextEditingValue(
        text: formatted,
        selection: TextSelection.fromPosition(
          TextPosition(offset: formatted.length),
        ),
      ),
    );
  }

  clearPhoneField() {
    _textEditingController.clear();
  }

  _updateTextField(Region region, TextEditingValue value) {
    _region = region;
    _textEditingController = PhoneNumberEditingController.fromValue(
      _plugin,
      value,
      regionCode: _region.code,
    );

    _phoneFieldState.add(
      PhoneFieldViewState(
        selectedRegion: _region,
        controller: _textEditingController,
      ),
    );
  }
}

mixin _ChatAppsController {
  GetChatAppsUseCase get getChatApps;
  SavePhoneNumberHistoryUseCase get savePhoneNumberHistory;

  Future<PhoneNumber> phoneNumber();

  clearPhoneField();

  Future<ChatAppsViewState> chatAppsState() =>
      getChatApps().then((value) => ChatAppsViewState(chatApps: value));

  Future<bool> onChatAppPressed(ChatApp chatApp) async {
    try {
      PhoneNumber phoneNumber = await this.phoneNumber();
      await _openChatApp(chatApp.deepLinkPrefix, phoneNumber.e164);
      await savePhoneNumberHistory(
        phoneNumber: phoneNumber.international,
      );
      clearPhoneField();
      return true;
    } catch (error, stackTrace) {
      logError(error, stackTrace);
    }
    return false;
  }

  _openChatApp(String deepLinkPrefix, String phoneNumber) async {
    final Uri uri = Uri.parse('$deepLinkPrefix$phoneNumber');
    if (!await canLaunchUrl(uri) ||
        !await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}
