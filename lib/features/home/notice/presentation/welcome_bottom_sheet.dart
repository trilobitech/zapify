import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ui/ui.dart';

import '../../../../common/di/inject.dart';
import '../../../../common/ext/context.dart';

class WelcomeBottomSheet extends StatelessWidget {
  const WelcomeBottomSheet._({required IAnalytics analytics})
    : _analytics = analytics;

  final IAnalytics _analytics;

  static Future<void> show(BuildContext context) async {
    final analytics = get<IAnalytics>();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => WelcomeBottomSheet._(analytics: analytics),
    );
    analytics.logEvent('welcome_message_closed');
  }

  @override
  Widget build(BuildContext context) {
    _analytics.logEvent('welcome_message_viewed');
    final strings = context.strings;
    return BottomSheetScaffold(
      illustration: ImageResolverWidget.illustration(
        uri: context.assets.illustrations.messageReceived,
      ),
      title: Text(strings.welcomeNoticeTitle),
      content: Html(
        data: strings.welcomeNoticeMessage(strings.appStoreName),
        style: {'p': Style(margin: Margins.symmetric(vertical: 4))},
      ),
      buttons: [
        FilledButton(
          onPressed: () {
            _analytics.buttonPressed('welcome_message_ok');
            Navigator.pop(context);
          },
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(strings.welcomeNoticeOkLabel.toUpperCase()),
            ),
          ),
        ),
      ],
    );
  }
}
