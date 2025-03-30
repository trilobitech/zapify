import 'package:error_adapter/error_adapter.dart';
import 'package:flutter/material.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import '../../../../../common/di/inject.dart';
import '../../../../../common/ext/context.dart';
import '../../../region/domain/entity/region.dart';
import '../../../region/region_mediator.dart';
import 'phone_field_bloc.dart';
import 'phone_field_error_registry.dart';
import 'phone_field_state.dart';

class PhoneFieldWidget extends StatelessWidget
    with StateActionMixin<PhoneFieldBloc, PhoneFieldState, PhoneFieldAction> {
  PhoneFieldWidget({super.key});

  late final _errorMessageAdapter = inject<FailureAdapter>(param1: PhoneFieldErrorConverterRegistry());

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
          prefix: _RegionSelectorButton(
            controller: state.controller,
            region: state.region,
            textFieldFocus: _textFieldFocus,
            textStyle: _textFieldStyle,
          ),
          labelText: context.strings.homePhoneNumberLabel,
          // https://github.com/flutter/flutter/issues/15400#issuecomment-475773473
          // helperText: ' ', // FIXME: talkback says "Space", should be avoided to fix it
          errorText: _errorMessageAdapter.maybeAdapt(context, state.error)?.message,
          contentPadding: const EdgeInsets.only(left: 8, right: 8),
          border: const OutlineInputBorder(),
        ),
        autocorrect: false,
        enableSuggestions: false,
      ),
    );
  }

  @override
  void handleAction(BuildContext context, PhoneFieldAction action) => switch (action) {
    HideKeyboardPhoneFieldAction() => dismissKeyboard(),
    ShowKeyboardPhoneFieldAction() => showKeyboard(),
  };

  void showKeyboard() => _textFieldFocus.requestFocus();

  void dismissKeyboard() => _textFieldFocus.unfocus();
}

class _RegionSelectorButton extends StatelessWidget {
  const _RegionSelectorButton({
    required this.controller,
    required this.region,
    required this.textFieldFocus,
    required this.textStyle,
  });

  final TextEditingController controller;
  final IRegion? region;
  final FocusNode textFieldFocus;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final region = this.region;
    if (region == null) {
      return Container();
    }

    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
        side: BorderSide.none,
      ),
      onPressed: () {
        if (!textFieldFocus.hasFocus && controller.text.isEmpty) {
          // avoid invisible region area click
          textFieldFocus.requestFocus();
          return;
        }
        context.read<RegionMediator>().showRegionPicker(region.code);
      },
      child: Text('${region.flag} +${region.prefix}', style: textStyle),
    );
  }
}
