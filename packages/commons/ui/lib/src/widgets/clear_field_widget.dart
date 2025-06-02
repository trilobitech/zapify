import 'package:flutter/material.dart';

class ClearFieldIconWidget extends StatefulWidget {
  const ClearFieldIconWidget({
    super.key,
    required this.controller,
    required this.semanticLabel,
  });

  final TextEditingController controller;
  final String semanticLabel;

  @override
  State<ClearFieldIconWidget> createState() => _ClearFieldIconWidgetState();
}

class _ClearFieldIconWidgetState extends State<ClearFieldIconWidget> {
  TextEditingController get controller => widget.controller;
  late bool isVisible = controller.text.isNotEmpty;

  @override
  void didUpdateWidget(covariant ClearFieldIconWidget oldWidget) {
    if (oldWidget.controller != controller) {
      oldWidget.controller.removeListener(_toggleVisibility);
      controller.addListener(_toggleVisibility);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_toggleVisibility);
  }

  @override
  void dispose() {
    controller.removeListener(_toggleVisibility);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return const SizedBox.shrink();
    }

    return IconButton(
      icon: Icon(Icons.cancel, semanticLabel: widget.semanticLabel),
      onPressed: controller.clear,
    );
  }

  void _toggleVisibility() {
    final newVisibility = controller.text.isNotEmpty;
    if (newVisibility != isVisible) {
      setState(() {
        isVisible = newVisibility;
      });
    }
  }
}
