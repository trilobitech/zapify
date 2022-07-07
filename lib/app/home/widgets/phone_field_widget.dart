import 'package:flutter/material.dart';
import 'package:zapfy/app/home/models/region.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    Key? key,
    this.region,
    required this.onRegionPressed,
    required this.controller,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final Region? region;
  final TextEditingController controller;
  final EdgeInsetsGeometry padding;
  final Function(Region?) onRegionPressed;

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
              // maxLength: 12,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.phone,
              onSubmitted: _onSubmitted,
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
    if (region == null) return null;

    return TextButton(
      onPressed: () {
        onRegionPressed(region);
      },
      child: Text(
        '${region!.flag} +${region!.prefix}',
        style: const TextStyle(fontSize: 22, height: 1.5),
      ),
    );
  }

  void _onSubmitted(String phoneNumber) {
    if (isValidPhoneNumber(phoneNumber)) {
      // launchChat(phoneNumber);
    }
  }

  bool isValidPhoneNumber(String phoneNumber) {
    // TODO: validate phone number
    return true;
  }
}
