import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:zapify/core/firebase.dart';

typedef OnError<T> = T Function(Object exception, StackTrace? stack);

void logDebug(dynamic message) {
  if (!kDebugMode) return;

  var location = Trace.current(1).frames[0].location;
  if (!Platform.isIOS) {
    location = '\x1B[1;96m$location\x1B[0m';
  }
  debugPrint('🤖 $location: ${message.toString()}');
}

void logError(Object? error, [StackTrace? stackTrace]) {
  stackTrace ??= Trace.current(1);
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
