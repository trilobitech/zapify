library ext;

import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

final _logger = Logger('ext');

dynamic get catchErrorLogger {
  final callerTrace = Trace.current(1);
  return (error, [StackTrace? stackTrace]) {
    _logger.severe(error.toString(), error, stackTrace ?? callerTrace);
  };
}
