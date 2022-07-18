import 'package:zapfy/core/firebase.dart';

import 'package:stack_trace/stack_trace.dart';

typedef OnError<T> = T Function(Object exception, StackTrace? stack);

void logError(Object? error, [StackTrace? stackTrace]) {
  stackTrace ??= StackTrace.current;
  crashlytics.recordError(error, stackTrace);
}

OnError get catchErrorLogger {
  Trace currentTrace = Trace.current(1);
  return (Object exception, StackTrace? stackTrace) async {
    final trace = Trace.from(stackTrace ?? Trace.current());
    if (!trace.frames.contains(currentTrace.frames.first)) {
      stackTrace = Trace(trace.frames + currentTrace.frames).vmTrace;
    }
    logError(exception, stackTrace);
  };
}
