import 'package:flutter/material.dart';

import '../../../../../common/ext/context.dart';

class InvalidPhoneNumberDialog extends StatefulWidget {
  const InvalidPhoneNumberDialog._();

  static Future<InvalidPhoneNumberDialogResult?> show(BuildContext context) {
    return showDialog<InvalidPhoneNumberDialogResult>(
      context: context,
      builder: (_) => const InvalidPhoneNumberDialog._(),
    );
  }

  @override
  State<InvalidPhoneNumberDialog> createState() =>
      _InvalidPhoneNumberDialogState();
}

class _InvalidPhoneNumberDialogState extends State<InvalidPhoneNumberDialog> {
  bool doNotAskAgain = false;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return AlertDialog(
      actionsPadding: const EdgeInsets.all(24).copyWith(bottom: 16, top: 8),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(top: 16),
      title: Text(strings.invalidPhoneNumberDialogTitle),
      content: Padding(
        padding: const EdgeInsets.all(8).copyWith(top: 0),
        child: Text(strings.invalidPhoneNumberDialogDescription),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              InvalidPhoneNumberDialogResult(
                decision: InvalidPhoneNumberDecision.openAnyway,
              ),
            );
          },
          child: Text(strings.invalidPhoneNumberDialogOpenAnywayLabel),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              InvalidPhoneNumberDialogResult(
                decision: InvalidPhoneNumberDecision.edit,
              ),
            );
          },
          child: Text(strings.invalidPhoneNumberDialogEditLabel),
        ),
      ],
    );
  }
}

enum InvalidPhoneNumberDecision { edit, openAnyway }

class InvalidPhoneNumberDialogResult {
  InvalidPhoneNumberDialogResult({required this.decision});

  final InvalidPhoneNumberDecision decision;
}
