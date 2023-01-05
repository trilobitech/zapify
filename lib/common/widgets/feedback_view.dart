import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';

import '../../common/di/inject.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({
    required this.text,
    this.button,
    super.key,
  });

  final String text;
  final FeedbackButton? button;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: textTheme.headline6?.copyWith(
              color: textTheme.headline6?.color?.withOpacity(.6),
            ),
          ),
          if (button != null)
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: button!.onClick,
                child: Text(button!.text.toUpperCase()),
              ),
            ),
        ],
      ),
    );
  }
}

class ErrorFeedbackView extends FeedbackView {
  const ErrorFeedbackView._(String text, FeedbackButton? button)
      : super(text: text, button: button);

  factory ErrorFeedbackView(
    BuildContext context, {
    required Object error,
    required VoidCallback? onRetryPressed,
  }) {
    final failure = get<ErrorMessageResolver>().resolve(context, error);
    final button =
        onRetryPressed != null && failure is ResolvedActionableFailure
            ? FeedbackButton(text: failure.action, onClick: onRetryPressed)
            : null;
    return ErrorFeedbackView._(failure.message, button);
  }
}

class FeedbackButton {
  const FeedbackButton({
    required this.text,
    required this.onClick,
  });

  final String text;
  final VoidCallback onClick;
}
