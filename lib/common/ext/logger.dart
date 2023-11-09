import 'package:logify/logify.dart';
import 'package:stack_trace/stack_trace.dart';

dynamic get catchErrorLogger {
  final callerTrace = Trace.current(1);
  return (error, [StackTrace? stackTrace]) {
    Log.e(error.toString(), error, stackTrace ?? callerTrace);
  };
}
