import 'package:flutter/widgets.dart';

abstract class AnalyticsWrapper {
  Future<void> init(bool isEnabled);

  Future<void> screenViewed(
    String screenName, {
    Map<String, Object> properties = const {},
  });

  Future<void> logEvent(
    String name, {
    Map<String, Object> properties = const {},
  });
}

abstract class IAnalytics {
  void screenViewed(
    String screenName, {
    Map<String, Object> properties = const {},
  });

  void onAppOpened({Map<String, Object> properties = const {}});

  void onAppLifecycleChanged(AppLifecycleState state);

  void buttonPressed(String name, {Map<String, Object> properties = const {}});

  void itemSelected(String name, {Map<String, Object> properties = const {}});

  void itemLongPressed(
    String name, {
    Map<String, Object> properties = const {},
  });

  void itemRemoved(String name, {Map<String, Object> properties = const {}});

  void intentHandled(String name, {Map<String, Object> properties = const {}});

  void errorDisplayed(String name, {Map<String, Object> properties = const {}});

  void logEvent(String name, {Map<String, Object> properties = const {}});
}
