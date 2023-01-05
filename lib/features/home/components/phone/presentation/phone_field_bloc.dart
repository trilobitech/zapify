import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:phone_number/phone_number.dart';

import '../../../../../common/arch/bloc_controller.dart';
import '../../../../region/domain/entity/region.dart';
import '../../../../region/domain/usecase/get_region.dart';
import '../phone_field_component.dart';
import 'error/home_failure.dart';
import 'phone_field_state.dart';

class PhoneFieldBloc extends BlocController<PhoneFieldEvent, PhoneFieldState>
    implements PhoneFieldComponent {
  PhoneFieldBloc(
    this._plugin, {
    required GetRegionUseCase getRegion,
    required GetDefaultRegionUseCase getDefaultRegion,
  })  : _getRegion = getRegion,
        _getDefaultRegion = getDefaultRegion,
        super(PhoneFieldState.initial());

  final PhoneNumberUtil _plugin;
  final GetRegionUseCase _getRegion;
  final GetDefaultRegionUseCase _getDefaultRegion;

  TextEditingController get _textEditingController => state.ctrl;

  Region get _region => state.region;

  @override
  Future<void> load() async {
    try {
      final region = await _getDefaultRegion();
      updatePhoneField(region: region);
    } catch (error, stackTrace) {
      Log.e(error, stackTrace);
    }
  }

  @override
  Future<PhoneNumber> getPhoneNumber() async {
    try {
      return await _parsePhoneNumber(_textEditingController.text, _region);
    } catch (error) {
      _emitState(error: error);
      rethrow;
    }
  }

  @override
  Future<void> updatePhoneField({
    String? phone,
    Region? region,
    bool showKeyboard = false,
  }) async {
    if (region == null) {
      if (phone == null) {
        throw 'Invalid arguments: "region" and/or "phone" should be not null';
      }
      region = await _tryParsePhoneNumber(phone).then((value) async {
        phone = await _plugin.format(value.nationalNumber, value.regionCode);
        return _getRegion(prefix: value.countryCode, code: value.regionCode);
      }).catchError((_) => _region);
    }

    final ctrl = PhoneNumberEditingController.fromValue(
      _plugin,
      _textEditingValueFrom(phone),
      regionCode: region.code,
    );

    _emitState(ctrl: ctrl, region: region);
    if (showKeyboard) {
      event(PhoneFieldEvent.showKeyboard());
    }
  }

  @override
  void clearField() {
    _textEditingController.clear();
    unfocusField();
  }

  @override
  void unfocusField() {
    add(PhoneFieldEvent.hideKeyboard());
  }

  Future<PhoneNumber> _tryParsePhoneNumber(String text) async {
    if (text.startsWith('+')) {
      return _parsePhoneNumber(text);
    }

    return _getDefaultRegion()
        .then((region) => _parsePhoneNumber(text, region))
        .catchError((e) => _parsePhoneNumber('+$text'));
  }

  Future<PhoneNumber> _parsePhoneNumber(String phone, [Region? region]) async {
    if (phone.isEmpty) {
      throw EmptyPhoneNumberFailure();
    }

    return await _plugin.parse(phone, regionCode: region?.code).catchError(
      (error, stackTrace) {
        // prevent phone number on error logging
        if (error is PlatformException && error.code == 'InvalidNumber') {
          error = InvalidPhoneNumberFailure();
        }
        Error.throwWithStackTrace(error, stackTrace);
      },
    );
  }

  void _addClearErrorListener() {
    final oldText = _textEditingController.text;
    late final Function() listener;
    listener = () {
      if (oldText == _textEditingController.text) return;
      _textEditingController.removeListener(listener);
      _emitState(error: null);
    };
    _textEditingController.addListener(listener);
  }

  TextEditingValue _textEditingValueFrom(String? text) {
    if (text == null) return _textEditingController.value;
    return TextEditingValue(
      text: text,
      selection: TextSelection.fromPosition(
        TextPosition(offset: text.length),
      ),
    );
  }

  void _emitState({
    TextEditingController? ctrl,
    Region? region,
    Object? error,
  }) {
    if (error != null) {
      _addClearErrorListener();
    }
    emit(state.copyWith(ctrl: ctrl, region: region, error: error));
  }
}
