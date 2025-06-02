import 'package:error_adapter/error_adapter.dart';
import 'package:flutter/material.dart';

import '../di/inject.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({
    super.key,
    required this.title,
    this.content,
    this.button,
    this.illustration,
  });

  final Widget? illustration;
  final String title;
  final String? content;
  final FeedbackButton? button;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final button = this.button;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            if (illustration != null) illustration!,
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                color: textTheme.titleLarge?.color?.withValues(alpha: .8),
              ),
            ),
            if (content != null)
              Text(
                content!,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: textTheme.bodyMedium?.color?.withValues(alpha: .8),
                ),
              ),
            if (button != null)
              FilledButton(
                onPressed: button.onClick,
                child: Text(button.text.toUpperCase()),
              ),
          ],
        ),
      ),
    );
  }
}

class ErrorFeedbackView extends FeedbackView {
  const ErrorFeedbackView._(String title, FeedbackButton? button)
    : super(title: title, button: button);

  factory ErrorFeedbackView(
    BuildContext context, {
    required Object error,
    required VoidCallback? onRetryPressed,
    ErrorConverterRegistry? additionalRegistry,
  }) {
    final failure = get<FailureAdapter>(
      param1: additionalRegistry,
    ).adapt(context, error);

    final button =
        onRetryPressed != null && failure is ErrorFeedback
            ? FeedbackButton(
              text: failure.primaryButtonText,
              onClick: onRetryPressed,
            )
            : null;

    return ErrorFeedbackView._(failure.message, button);
  }
}

class FeedbackButton {
  const FeedbackButton({required this.text, required this.onClick});

  final String text;
  final VoidCallback onClick;
}

class ErrorFeedback implements Failure {
  ErrorFeedback({required this.message, required this.primaryButtonText});

  @override
  final String message;

  final String primaryButtonText;
}
