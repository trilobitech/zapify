import 'package:zapfy/core/firebase.dart';

void logError(Object? error, [StackTrace? stackTrace]) {
  crashlytics.recordError(error, stackTrace);
}
