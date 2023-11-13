import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class IAnalytics {
  Future<void> init() => Future.value();

  void logEvent(String name, {Map<String, Object> properties = const {}});

  void onAppOpened({Map<String, Object> properties = const {}});

  void onAppLifecycleChanged(AppLifecycleState state);

  void screenViewed(
    String screenName, {
    Map<String, Object> properties = const {},
  });

  void buttonPressed(
    String name, {
    Map<String, Object> properties = const {},
  });

  void itemSelected(
    String name, {
    Map<String, Object> properties = const {},
  });

  void itemLongPressed(
    String name, {
    Map<String, Object> properties = const {},
  });

  void itemRemoved(
    String name, {
    Map<String, Object> properties = const {},
  });

  void intentHandled(
    String name, {
    Map<String, Object> properties = const {},
  });
}
