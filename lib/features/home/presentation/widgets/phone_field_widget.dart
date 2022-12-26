import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/inject.dart';
import '../../../../core/ext/context.dart';
import '../../../shared/domain/entity/region.dart';

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
    this.focusNode,
  }) : super(key: key);

  final Region? region;
  final TextEditingController controller;
  final EdgeInsetsGeometry padding;
  final OnRegionPressed onRegionPressed;
  final OnSubmitted? onSubmitted;
  final dynamic error;
  final FocusNode? focusNode;

  @override
  State<StatefulWidget> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneFieldWidget> {
  late final _errorMessageResolver = inject<ErrorMessageResolver>();
  final TextStyle _textFieldStyle = const TextStyle(fontSize: 24, height: 1.5);
  late FocusNode _textFieldFocus;

  @override
  void initState() {
    super.initState();
    _textFieldFocus = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _textFieldFocus.dispose();
    }
    super.dispose();
  }

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
          // helperText: ' ', // FIXME: talkback says "Space", should be avoided to fix it
          errorText: _errorMessageResolver
              .maybeResolve(context, widget.error)
              ?.message,
          contentPadding: const EdgeInsets.only(left: 8, right: 8),
          border: const OutlineInputBorder(),
        ),
        autocorrect: false,
        enableSuggestions: false,
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
          // avoid invisible region area click
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
