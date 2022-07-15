import 'package:flutter/material.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/core/error_handler/error_message_resolver.dart';
import 'package:zapfy/core/ext/context.dart';
import 'package:zapfy/features/shared/domain/entity/region.dart';

typedef OnSubmitted = Function(String);
typedef OnRegionPressed = Function(Region);

class PhoneFieldWidget extends StatefulWidget {
  const PhoneFieldWidget({
    Key? key,
    this.region,
    required this.onRegionPressed,
    this.onSubmitted,
    required this.controller,
    this.error,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final Region? region;
  final TextEditingController controller;
  final EdgeInsetsGeometry padding;
  final OnRegionPressed onRegionPressed;
  final OnSubmitted? onSubmitted;
  final dynamic error;

  @override
  State<StatefulWidget> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneFieldWidget> {
  late final _errorMessageResolver = inject<ErrorMessageResolver>();
  final TextStyle _textFieldStyle = const TextStyle(fontSize: 24, height: 1.5);
  final FocusNode _textFieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextField(
        key: const ValueKey('PhoneNumber'),
        style: _textFieldStyle,
        focusNode: _textFieldFocus,
        controller: widget.controller,
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.phone,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          prefix: widget.region != null
              ? regionSelectorButton(widget.region!)
              : null,
          labelText: context.strings.homePhoneNumberLabel,
          // https://github.com/flutter/flutter/issues/15400#issuecomment-475773473
          helperText: ' ',
          errorText: _errorMessageResolver.maybeResolve(context, widget.error),
          contentPadding: const EdgeInsets.only(left: 8, right: 8),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget regionSelectorButton(Region region) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
        side: BorderSide.none,
      ),
      onPressed: () {
        if (!_textFieldFocus.hasFocus && widget.controller.text.isEmpty) {
          setState(() {
            _textFieldFocus.requestFocus();
          });
          return;
        }
        _textFieldFocus.unfocus();
        widget.onRegionPressed(region);
      },
      child: Text(
        '${region.flag} +${region.prefix}',
        style: _textFieldStyle,
      ),
    );
  }
}
