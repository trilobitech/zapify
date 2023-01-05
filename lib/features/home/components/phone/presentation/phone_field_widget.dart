import 'dart:async';

import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';

import '../../../../../common/arch/bloc_widget.dart';
import '../../../../../common/di/inject.dart';
import '../../../../../common/ext/context.dart';
import '../../../../region/region_mediator.dart';
import 'phone_field_bloc.dart';
import 'phone_field_state.dart';

class PhoneFieldWidget extends StatelessWidget
    with BlocWidget<PhoneFieldBloc, PhoneFieldEvent, PhoneFieldState> {
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
        controller: state.ctrl,
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
  FutureOr<void> handleEvent(BuildContext context, PhoneFieldEvent event) =>
      event.when(
        hideKeyboard: dismissKeyboard,
        showKeyboard: showKeyboard,
      );

  Widget regionSelectorButton(BuildContext context, PhoneFieldState state) {
    final region = state.region;

    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
        side: BorderSide.none,
      ),
      onPressed: () {
        if (!_textFieldFocus.hasFocus && state.ctrl.text.isEmpty) {
          // avoid invisible region area click
          showKeyboard();
          return;
        }
        context.read<RegionMediator>().showRegionPicker(region);
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
