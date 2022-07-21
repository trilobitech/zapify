import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';

FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;

FirebaseAnalytics get analytics => FirebaseAnalytics.instance;

extension AnalyticsExt on FirebaseAnalytics {
  void logButtonPressed(
    String buttonName, [
    Map<String, String> aditionalParams = const {},
  ]) {
    logEvent(
      name: 'button_clicked',
      parameters: {'button_name': buttonName, ...aditionalParams},
    );
  }

  set currentScreen(Widget widget) {
    final clazz = widget.runtimeType.toString();
    setCurrentScreen(screenName: clazz, screenClassOverride: clazz);
  }
}
