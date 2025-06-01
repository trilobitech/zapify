import 'package:flutter/material.dart';

class BottomSheetScaffold extends StatelessWidget {
  const BottomSheetScaffold({
    super.key,
    required this.illustration,
    required this.title,
    required this.content,
    required this.buttons,
  });

  final Widget illustration;
  final Widget title;
  final Widget content;
  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Container(
                width: 32,
                height: 4,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              illustration,
              DefaultTextStyle(
                style: theme.textTheme.displaySmall!,
                textAlign: TextAlign.center,
                child: title,
              ),
              DefaultTextStyle(
                style: theme.textTheme.bodyLarge!,
                textAlign: TextAlign.start,
                child: content,
              ),
              ...buttons,
            ],
          ),
        ),
      ),
    );
  }
}
