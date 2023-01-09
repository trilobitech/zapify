import 'dart:async';

import 'package:bloc_plus/bloc_plus.dart';
import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';

import '../../../../../common/ext/context.dart';
import '../../../../../di/inject.dart';
import '../../../../region/region_mediator.dart';
import 'phone_field_bloc.dart';
import 'phone_field_state.dart';

class PhoneFieldWidget extends StatelessWidget
    with StateActionMixin<PhoneFieldBloc, PhoneFieldState, PhoneFieldAction> {
  PhoneFieldWidget({super.key});

  late final _errorMessageResolver = inject<ErrorMessageResolver>();

  late final FocusNode _textFieldFocus = FocusNode();
  final TextStyle _textFieldStyle = const TextStyle(fontSize: 24, height: 1.5);

  @override
  Widget buildState(BuildContext context, PhoneFieldState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        key: const ValueKey('PhoneNumber'),
        style: _textFieldStyle,
        focusNode: _textFieldFocus,
        controller: state.controller,
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.phone,
        // onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          prefix: regionSelectorButton(context, state),
          labelText: context.strings.homePhoneNumberLabel,
          // https://github.com/flutter/flutter/issues/15400#issuecomment-475773473
          // helperText: ' ', // FIXME: talkback says "Space", should be avoided to fix it
          errorText:
              _errorMessageResolver.maybeResolve(context, state.error)?.message,
          contentPadding: const EdgeInsets.only(left: 8, right: 8),
          border: const OutlineInputBorder(),
        ),
        autocorrect: false,
        enableSuggestions: false,
      ),
    );
  }

  @override
  FutureOr<void> handleAction(BuildContext context, PhoneFieldAction action) =>
      action.when(
        hideKeyboard: dismissKeyboard,
        showKeyboard: showKeyboard,
      );

  Widget? regionSelectorButton(
    BuildContext context,
    PhoneFieldState state,
  ) {
    final controller = state.controller;
    final region = state.region;

    if (region == null) {
      return null;
    }

    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
        side: BorderSide.none,
      ),
      onPressed: () {
        if (!_textFieldFocus.hasFocus && controller.text.isEmpty) {
          // avoid invisible region area click
          showKeyboard();
          return;
        }
        context.read<RegionMediator>().showRegionPicker(region.code);
      },
      child: Text(
        '${region.flag} +${region.prefix}',
        style: _textFieldStyle,
      ),
    );
  }

  void showKeyboard() => _textFieldFocus.requestFocus();

  void dismissKeyboard() => _textFieldFocus.unfocus();
}
