abstract class AnalyticsWrapper {
  Future<void> init(bool isEnabled);

  Future<void> screenViewed(
    String screenName, {
    Map<String, dynamic> properties = const {},
  });

  Future<void> logEvent(name, {Map<String, dynamic> properties = const {}});
}
