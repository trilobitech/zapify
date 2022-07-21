import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

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
}
