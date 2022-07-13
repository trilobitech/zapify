import 'package:flutter/material.dart';
import 'package:zapfy/features/shared/domain/entity/region.dart';

typedef OnSubmitted = Function(String);
typedef OnRegionPressed = Function(Region);

class PhoneFieldWidget extends StatelessWidget {
  PhoneFieldWidget({
    Key? key,
    Region? region,
    required this.onRegionPressed,
    this.onSubmitted,
    required this.controller,
    this.padding = EdgeInsets.zero,
  })  : _region = region,
        super(key: key);

  final Region? _region;
  final TextEditingController controller;
  final EdgeInsetsGeometry padding;
  final OnRegionPressed onRegionPressed;
  final OnSubmitted? onSubmitted;
  final TextStyle _textFieldStyle = const TextStyle(fontSize: 20, height: 1.5);
  // Workaround to adapt region button respecting content width
  late final _regionButtonSize =
      _calcTextWidth('🇧🇷  +99999', _textFieldStyle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          if (_region != null) regionSelectorButton(_region!),
          Expanded(
            child: TextField(
              style: _textFieldStyle,
              controller: controller,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.phone,
              onSubmitted: onSubmitted,
              decoration: const InputDecoration(
                labelText: 'Phone number',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                border: OutlineInputBorder(),
                // errorText: 'an error',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget regionSelectorButton(Region region) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: _regionButtonSize,
      ),
      child: TextButton(
        onPressed: () {
          onRegionPressed(region);
        },
        child: Text(
          '${region.flag} +${region.prefix}',
          style: _textFieldStyle,
        ),
      ),
    );
  }

  double _calcTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance!.window.textScaleFactor,
    )..layout();
    return textPainter.size.width;
  }
}
