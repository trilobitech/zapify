import 'package:flutter/material.dart';
import 'package:zapfy/features/home/domain/entity/region.dart';

typedef OnSubmitted = Function(String);
typedef OnRegionPressed = Function(Region);

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 22, height: 1.5),
              controller: controller,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.phone,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                prefix: regionSelectorButton(),
                labelText: 'Phone number',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                border: const OutlineInputBorder(),
                // errorText: 'an error',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? regionSelectorButton() {
    final region = _region;
    if (region == null) return null;

    return TextButton(
      onPressed: () {
        onRegionPressed(region);
      },
      child: Text(
        '${region.flag} +${region.prefix}',
        style: const TextStyle(fontSize: 22, height: 1.5),
      ),
    );
  }
}
