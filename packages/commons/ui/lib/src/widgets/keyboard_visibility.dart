import 'package:flutter/widgets.dart';

typedef OnKeyboardVisibilityBuilder =
    Widget Function(
      BuildContext context,
      Widget? child,
      bool isKeyboardVisible,
    );

// Calls `builder` on keyboard close/open.
/// https://stackoverflow.com/a/63241409/1321917
class KeyboardVisibilityBuilder extends StatefulWidget {
  const KeyboardVisibilityBuilder({
    super.key,
    this.child,
    required this.builder,
  });

  final Widget? child;

  final OnKeyboardVisibilityBuilder builder;

  @override
  State<KeyboardVisibilityBuilder> createState() =>
      _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder>
    with WidgetsBindingObserver {
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = View.of(context).viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, widget.child, _isKeyboardVisible);
}
