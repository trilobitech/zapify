import 'package:flutter/material.dart';
import 'package:phone_number/phone_number.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zapfy/core/logger.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';
import 'package:zapfy/features/home/domain/entity/region.dart';
import 'package:zapfy/features/home/domain/usecase/get_chat_apps.dart';
import 'package:zapfy/features/home/domain/usecase/save_phone_number_history.dart';
import 'package:zapfy/features/home/presentation/home_state.dart';

class HomeController with _PhoneFieldController, _ChatAppsController {
  HomeController({
    required PhoneNumberUtil plugin,
    required this.getChatApps,
    required this.savePhoneNumberHistory,
  }) : _plugin = plugin;

  @override
  final PhoneNumberUtil _plugin;

  @override
  final GetChatAppsUseCase getChatApps;

  @override
  final SavePhoneNumberHistoryUseCase savePhoneNumberHistory;
}

mixin _PhoneFieldController {
  PhoneNumberUtil get _plugin;

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
    _region = region;
    _textEditingController = PhoneNumberEditingController.fromValue(
      _plugin,
      _textEditingController.value,
      regionCode: region.code,
    );

    _phoneFieldState.add(
      PhoneFieldViewState(
        selectedRegion: _region,
        controller: _textEditingController,
      ),
    );
  }

  onPhoneNumberChanged(String phoneNumberString) async {
    final phoneNumber = await _plugin.parse(phoneNumberString);
    _textEditingController.text = phoneNumber.nationalNumber;
    _textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: _textEditingController.text.length),
    );
  }

  clearPhoneField() {
    _textEditingController.clear();
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
