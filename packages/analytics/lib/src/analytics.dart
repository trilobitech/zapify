import 'composite.dart';
import 'impl/amplitude.dart';
import 'impl/firebase.dart';
import 'wrapper.dart';

IAnalytics get analytics => _analytics;

late Analytics _analytics;

Future<void> initAnalytics({
  required String amplitudeKey,
  required bool isEnabled,
}) async {
  _analytics = Analytics([
    FirebaseAnalyticsWrapper(),
    AmplitudeAnalyticsWrapper(apiKey: amplitudeKey),
  ]);
  await _analytics.init(isEnabled);
}
