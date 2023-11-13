import 'package:amplitude_flutter/amplitude.dart';
import 'package:analytics_core/analytics_core.dart';
import 'package:config/config.dart';
import 'package:flutter/foundation.dart';

import '../logger.dart';

class AmplitudeAnalyticsWrapper extends IAnalytics with AnalyticsMixin {
  late final Amplitude _instance = Amplitude.getInstance();

  @override
  Future<void> init() async {
    if (kDebugMode) {
      logger.info('Amplitude is disabled in debug mode');
      return;
    }
    await _instance.init(EnvConfig.amplitudeKey);
  }

  @override
  void logEvent(
    String name, {
    Map<String, dynamic> properties = const {},
  }) async {
    if (kDebugMode) return;
    
    try {
      await _instance.logEvent(name, eventProperties: properties);
    } catch (e, stack) {
      final msg = 'Failed to log event {name: $name, properties: $properties}';
      logger.severe(msg, e, stack);
    }
  }
}
