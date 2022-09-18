import 'package:zapify/core/analytics/impl/amplitude.dart';
import 'package:zapify/core/analytics/impl/firebase.dart';

import '../../config/env_config.dart';
import 'composite.dart';
import 'wrapper.dart';

IAnalytics get analytics => _analytics;

final Analytics _analytics = Analytics([
  FirebaseAnalyticsWrapper(),
  AmplitudeAnalyticsWrapper(apiKey: EnvConfig.amplitudeKey),
]);

Future<void> initAnalytics({required bool isEnabled}) =>
    _analytics.init(isEnabled);
