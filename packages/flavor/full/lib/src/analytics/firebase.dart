import 'package:analytics_core/analytics_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

import '../logger.dart';

class FirebaseAnalyticsWrapper extends IAnalytics with AnalyticsMixin {
  late final FirebaseAnalytics _firebase = FirebaseAnalytics.instance;

  @override
  Future<void> init() => _firebase.setAnalyticsCollectionEnabled(kReleaseMode);

  @override
  void screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  }) async {
    try {
      await _firebase.setCurrentScreen(screenName: screenName);
    } catch (e, stack) {
      final msg =
          'Failed to log screenViewed {screenName: $screenName, properties: $properties}';
      logger.severe(msg, e, stack);
    }
  }

  @override
  void logEvent(
    String name, {
    Map<String, dynamic> properties = const {},
  }) async {
    try {
      await _firebase.logEvent(name: name, parameters: properties);
    } catch (e, stack) {
      final msg = 'Failed to log event {name: $name, properties: $properties}';
      logger.severe(msg, e, stack);
    }
  }
}
