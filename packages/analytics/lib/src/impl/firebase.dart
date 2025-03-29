import 'package:firebase_analytics/firebase_analytics.dart';

import '../wrapper.dart';

class FirebaseAnalyticsWrapper extends AnalyticsWrapper {
  late final FirebaseAnalytics _firebase = FirebaseAnalytics.instance;

  @override
  Future<void> init(bool isEnabled) => _firebase.setAnalyticsCollectionEnabled(isEnabled);

  @override
  Future<void> screenViewed(
    String screenName, {
    Map<String, Object> properties = const {},
  }) =>
      _firebase.logScreenView(screenName: screenName);

  @override
  Future<void> logEvent(
    String name, {
    Map<String, Object> properties = const {},
  }) =>
      _firebase.logEvent(name: name, parameters: properties);
}
