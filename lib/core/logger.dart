import 'package:zapfy/core/firebase.dart';

void logError(Object? error, [StackTrace? stackTrace]) {
  stackTrace ??= StackTrace.current;
  crashlytics.recordError(error, stackTrace);
}
