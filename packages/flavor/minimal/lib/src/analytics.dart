import 'package:analytics_core/analytics_core.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

class LoggerAnalytics extends IAnalytics with AnalyticsMixin {
  final Logger _logger = Logger('Analytics');

  @override
  void logEvent(
    name, {
    Map<String, dynamic> properties = const {},
  }) =>
      _logger.fine(
        'Analytics trigged: {$name: $properties}',
        null,
        Trace.current(2),
      );
}
