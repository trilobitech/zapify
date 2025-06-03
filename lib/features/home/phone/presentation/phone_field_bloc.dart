import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:logify/logify.dart';
import 'package:phone_number/phone_number.dart' hide RegionInfo;
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../history/domain/entity/history.dart';
import '../../../region/domain/entity/region.dart';
import '../../../region/domain/usecase/find_region_by_prefix.dart';
import '../../../region/domain/usecase/get_default_region.dart';
import '../domain/phone_field_error.dart';
import '../phone_field_component.dart';
import 'phone_field_state.dart';

class PhoneFieldBloc extends StateActionBloc<PhoneFieldState, PhoneFieldAction>
    implements PhoneFieldComponent {
  PhoneFieldBloc(
    this._plugin, {
    required GetDefaultRegionUseCase getDefaultRegion,
    required FindRegionByPrefixUseCase findRegionByPrefix,
  }) : _getDefaultRegion = getDefaultRegion,
       _findRegionByPrefix = findRegionByPrefix,
       super(PhoneFieldState.initial());

  final PhoneNumberUtil _plugin;
  final GetDefaultRegionUseCase _getDefaultRegion;
  final FindRegionByPrefixUseCase _findRegionByPrefix;

  TextEditingController get _textEditingController => currentState.controller;

  String get _currentText => _textEditingController.text;

  IRegion? get _region => currentState.region;

  @override
  Future<void> load() async {
    try {
      final region = await _getDefaultRegion();
      await _updatePhoneField(_currentText, region);
    } catch (error, stackTrace) {
      Log.e(error, stackTrace);
    }
  }

  @override
  Future<PhoneNumber> getPhoneNumber() async {
    try {
      return await _parsePhoneNumber(_currentText, _region?.code);
    } catch (error) {
      _emitState(error: error);
      rethrow;
    }
  }

  @override
  Future<void> updatePhoneFromHistoric(HistoryEntry entry) async {
    final phoneExpr = RegExp(r'^\+(?<prefix>\d+) (?<phoneNumber>.+)$');
    final matches = phoneExpr.allMatches(entry.phoneNumber).firstOrNull;
    final prefix = matches?.namedGroup('prefix');
    final phoneNumber = matches?.namedGroup('phoneNumber');
    final region =
        prefix != null ? await _findRegionByPrefix(int.parse(prefix)) : null;

    if (phoneNumber == null || region == null) return;

    await _updatePhoneField(phoneNumber, region);
  }

  @override
  Future<void> updatePhoneFromText(String phone) async {
    if (phone == _currentText) return;

    final parsed = await _tryParsePhoneNumber(phone);
    final region = parsed?.region ?? _region;

    if (region == null) return;

    await _updatePhoneField(parsed?.nationalNumber ?? phone, region);
  }

  @override
  Future<void> updateRegion(IRegion region) async {
    await _updatePhoneField(_currentText, region);
    sendAction(PhoneFieldAction.showKeyboard());
  }

  @override
  void clearField() {
    _textEditingController.clear();
    unfocusField();
  }

  @override
  void requestFieldFocus() {
    sendAction(PhoneFieldAction.showKeyboard());
  }

  @override
  void unfocusField() {
    sendAction(PhoneFieldAction.hideKeyboard());
  }

  Future<void> _updatePhoneField(String phone, IRegion region) async {
    if (phone == _currentText && region == _region) return;

    final formattedPhone = await _plugin
        .format(phone, region.code)
        .catchError((_) => phone);

    final newValue = _textEditingValueFrom(formattedPhone);

    if (region.code == _region?.code) {
      _textEditingController.value = newValue;

      return;
    }

    final controller = PhoneNumberEditingController.fromValue(
      _plugin,
      newValue,
      regionCode: region.code,
      behavior: PhoneInputBehavior.strict,
    );

    _emitState(controller: controller, region: region);
  }

  Future<PhoneNumber?> _tryParsePhoneNumber(String text) async {
    if (text.isEmpty) return null;

    if (text.startsWith('+')) return _parsePhoneNumber(text);

    return _getDefaultRegion()
        .then<PhoneNumber?>((region) => _parsePhoneNumber(text, region.code))
        .catchError((_) => _parsePhoneNumber('+$text'))
        .catchError((_) => null);
  }

  Future<PhoneNumber> _parsePhoneNumber(
    String phone, [
    RegionCode? regionCode,
  ]) async {
    if (phone.isEmpty) throw EmptyPhoneNumberError();

    return await _plugin.parse(phone, regionCode: regionCode).catchError((
      error,
      stackTrace,
    ) {
      // prevent phone number on error logging
      if (error is PlatformException && error.code == 'InvalidNumber') {
        error = InvalidPhoneNumberError(
          'Invalid phone number with initial numbers: '
          '${phone.substring(0, math.min(3, phone.length))}',
        );
      }
      Error.throwWithStackTrace(error, stackTrace);
    });
  }

  void _addClearErrorListener() {
    final oldText = _currentText;
    late final VoidCallback listener;

    _textEditingController.addListener(
      listener = () {
        if (oldText == _currentText) return;
        _textEditingController.removeListener(listener);
        _emitState(error: null);
      },
    );
  }

  TextEditingValue _textEditingValueFrom(String text) {
    return TextEditingValue(
      text: text,
      selection: TextSelection.fromPosition(TextPosition(offset: text.length)),
    );
  }

  void _emitState({
    TextEditingController? controller,
    IRegion? region,
    Object? error,
  }) {
    if (error != null) _addClearErrorListener();

    final newState = currentState.copyWith(
      controller: controller,
      region: region,
      error: error,
    );

    setState(newState);
  }
}

extension _PhoneNumberExt on PhoneNumber {
  Region get region => Region(code: regionCode, prefix: int.parse(countryCode));
}
