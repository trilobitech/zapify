import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:zapify/core/analytics/wrapper.dart';

class FirebaseAnalyticsWrapper extends AnalyticsWrapper {
  late final FirebaseAnalytics _firebase = FirebaseAnalytics.instance;

  @override
  Future<void> init(bool isEnabled) =>
      _firebase.setAnalyticsCollectionEnabled(isEnabled);

  @override
  Future<void> screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  }) =>
      _firebase.setCurrentScreen(screenName: screenName);

  @override
  Future<void> logEvent(name, {Map<String, dynamic> properties = const {}}) =>
      _firebase.logEvent(name: name, parameters: properties);
}
