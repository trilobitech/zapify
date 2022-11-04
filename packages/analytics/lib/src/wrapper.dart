import 'package:flutter/widgets.dart';

abstract class AnalyticsWrapper {
  Future<void> init(bool isEnabled);

  Future<void> screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  });

  Future<void> logEvent(name, {Map<String, dynamic> properties = const {}});
}

abstract class IAnalytics {
  void screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  });

  void onAppOpened({Map<String, dynamic> properties = const {}});

  void onAppLifecycleChanged(AppLifecycleState state);

  void buttonPressed(
    String name, {
    Map<String, dynamic> properties = const {},
  });

  void itemSelected(
    String name, {
    Map<String, dynamic> properties = const {},
  });

  void itemLongPressed(
    String name, {
    Map<String, dynamic> properties = const {},
  });

  void itemRemoved(
    String name, {
    Map<String, dynamic> properties = const {},
  });

  void intentHandled(
    String name, {
    Map<String, dynamic> properties = const {},
  });

  void logEvent(name, {Map<String, dynamic> properties = const {}});
}
