import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

typedef OnError<T> = T Function(Object exception, StackTrace? stack);

typedef ErrorRecorder = void Function(Object? exception, StackTrace? stack);

ErrorRecorder? _errorRecorder;

void defaultErrorRecorder(ErrorRecorder? errorRecorder) {
  _errorRecorder = errorRecorder;
}

void logDebug(dynamic message, {bool skipCallerFile = false}) {
  if (!kDebugMode) return;

  final trace = Trace.current(1);
  final caller = trace.frames.first;

  String location = trace.frames
      .firstWhere(
        (el) => !skipCallerFile || el.library != caller.library,
        orElse: () => caller,
      )
      .location;

  if (!Platform.isIOS) {
    location = '\x1B[1;96m$location\x1B[0m';
  }
  debugPrint('🤖 $location: ${message.toString()}');
}

void logError(Object? error, [StackTrace? stackTrace]) {
  stackTrace ??= Trace.current(1);
  _errorRecorder?.call(error, stackTrace);
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
