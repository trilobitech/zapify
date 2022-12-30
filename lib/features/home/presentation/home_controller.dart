import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:phone_number/phone_number.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/env_config.dart';
import '../../../config/remote_config.dart';
import '../../shared/domain/entity/region.dart';
import '../domain/entity/banner.dart';
import '../domain/entity/chat_app.dart';
import '../domain/usecase/app_review.dart';
import '../domain/usecase/get_chat_apps.dart';
import '../domain/usecase/get_region.dart';
import '../domain/usecase/get_top_banner.dart';
import '../domain/usecase/save_phone_number_history.dart';
import 'error/home_failure.dart';
import 'home_state.dart';

class HomeController
    with
        _BannerController,
        _PhoneFieldController,
        _ChatAppsController,
        _AdBannerController {
  HomeController({
    required PhoneNumberUtil plugin,
    required this.getDefaultRegion,
    required this.getRegion,
    required this.getChatApps,
    required this.savePhoneNumberHistory,
    required this.getTopBanner,
    required this.setLastAppReviewAtNow,
  }) : _plugin = plugin {
    init();
  }

  @override
  final PhoneNumberUtil _plugin;

  @override
  final GetDefaultRegionUseCase getDefaultRegion;

  @override
  final GetRegionUseCase getRegion;

  @override
  final GetChatAppsUseCase getChatApps;

  @override
  final SavePhoneNumberHistoryUseCase savePhoneNumberHistory;

  @override
  final GetTopBannerUseCase getTopBanner;

  @override
  final SetLastAppReviewAtNow setLastAppReviewAtNow;

  Future<void> init() async {
    try {
      final region = await getDefaultRegion();
      onRegionSelected(region);
    } catch (error, stackTrace) {
      Log.e(error, stackTrace);
    }
  }
}

mixin _BannerController {
  GetTopBannerUseCase get getTopBanner;
  SetLastAppReviewAtNow get setLastAppReviewAtNow;

  Stream<BannerViewState> get bannerViewState => getTopBanner();

  void onTopBannerActionTap(TopBannerType type) {
    switch (type) {
      case TopBannerType.appReview:
        askForReview();
        break;
    }
  }

  Future<void> askForReview() async {
    final inAppReview = InAppReview.instance;

    await inAppReview
        .isAvailable()
        .then((isAvailable) async {
          if (!isAvailable) {
            throw 'InAppReview not available';
          }
        })
        .then((value) => inAppReview.requestReview())
        .catchError((error, stack) {
          Log.e(error, stack);
          return inAppReview.openStoreListing(appStoreId: EnvConfig.appStoreId);
        })
        .then((_) => setLastAppReviewAtNow());
  }
}

mixin _PhoneFieldController {
  PhoneNumberUtil get _plugin;
  GetRegionUseCase get getRegion;
  GetDefaultRegionUseCase get getDefaultRegion;

  TextEditingController _textEditingController = TextEditingController();
  Region _region = Region.br();

  late final BehaviorSubject<PhoneFieldViewState> _phoneFieldState =
      BehaviorSubject.seeded(
    PhoneFieldViewState(
      selectedRegion: _region,
      controller: _textEditingController,
    ),
  );

  Stream<PhoneFieldViewState> get phoneFieldState => _phoneFieldState;

  Future<PhoneNumber> phoneNumber() async {
    try {
      if (_textEditingController.text.isEmpty) {
        throw EmptyPhoneNumberFailure();
      }
      return await _plugin
          .parse(_textEditingController.text, regionCode: _region.code)
          .catchError(
        (error, stackTrace) {
          if (error is PlatformException && error.code == 'InvalidNumber') {
            error = InvalidPhoneNumberFailure();
          }
          Error.throwWithStackTrace(error, stackTrace);
        },
      );
    } catch (error) {
      _refreshState(error);
      rethrow;
    }
  }

  void clearPhoneField() {
    _textEditingController.clear();
  }

  void onRegionSelected(Region region) {
    _updateTextField(region, _textEditingController.value);
  }

  Future<void> onPhoneNumberSelected(String phoneNumber) =>
      onPhoneNumberReceived(phoneNumber);

  Future<void> onPhoneNumberReceived(String phoneNumber) async {
    if (phoneNumber.startsWith('+')) {
      return _updatePhoneNumberFromString(phoneNumber);
    }

    final region = await getDefaultRegion();
    return _updatePhoneNumberFromString('+${region.prefix}$phoneNumber')
        .catchError((e) async => _updatePhoneNumberFromString('+$phoneNumber'))
        .catchError((e) => _updatePhoneFieldWith(phoneNumber: phoneNumber));
  }

  Future<void> _updatePhoneNumberFromString(String phoneNumberString) async {
    final phoneNumber = await _plugin.parse(phoneNumberString);
    final region = await getRegion(
      prefix: phoneNumber.countryCode,
      code: phoneNumber.regionCode,
    );
    final formatted =
        await _plugin.format(phoneNumber.nationalNumber, region.code);

    _updatePhoneFieldWith(
      region: region,
      phoneNumber: formatted,
    );
  }

  void _updatePhoneFieldWith({Region? region, required String phoneNumber}) {
    _updateTextField(
      region ?? _region,
      TextEditingValue(
        text: phoneNumber,
        selection: TextSelection.fromPosition(
          TextPosition(offset: phoneNumber.length),
        ),
      ),
    );
  }

  void _updateTextField(Region region, TextEditingValue value) {
    _region = region;
    _textEditingController = PhoneNumberEditingController.fromValue(
      _plugin,
      value,
      regionCode: _region.code,
    );

    _refreshState();
  }

  void _refreshState([dynamic error]) {
    if (error != null) {
      _addClearErrorListener();
    }

    _phoneFieldState.add(
      PhoneFieldViewState(
        selectedRegion: _region,
        controller: _textEditingController,
        error: error,
      ),
    );
  }

  void _addClearErrorListener() {
    final oldText = _textEditingController.text;
    late final Function() listener;
    listener = () {
      if (oldText == _textEditingController.text) return;
      _textEditingController.removeListener(listener);
      _refreshState();
    };
    _textEditingController.addListener(listener);
  }
}

mixin _ChatAppsController {
  GetChatAppsUseCase get getChatApps;
  SavePhoneNumberHistoryUseCase get savePhoneNumberHistory;

  Future<PhoneNumber> phoneNumber();

  clearPhoneField();

  Stream<ChatAppsViewState> get chatAppsState =>
      getChatApps().map((value) => ChatAppsViewState(chatApps: value));

  Future<bool> onChatAppPressed(ChatApp chatApp) async {
    try {
      PhoneNumber phoneNumber = await this.phoneNumber();
      await _openChatApp(
        chatApp.deepLinkPrefix,
        phoneNumber.e164.replaceFirst('+', ''),
      );
      await savePhoneNumberHistory(
        phoneNumber: phoneNumber.international,
      );
      clearPhoneField();
      return true;
    } catch (error, stackTrace) {
      Log.e(error, stackTrace);
    }
    return false;
  }

  Future<void> _openChatApp(String deepLinkPrefix, String phoneNumber) async {
    final Uri uri = Uri.parse('$deepLinkPrefix$phoneNumber');
    if (!await canLaunchUrl(uri) ||
        !await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}

mixin _AdBannerController {
  Future<AdBannerViewState> get adBannerState async {
    final String unitId = await RemoteConfig.homeBannerUnitId.get();

    if (unitId.isEmpty) {
      return AdBannerViewState.none();
    }

    return AdBannerViewState(unitId: unitId);
  }
}
