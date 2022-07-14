import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void logError(Object? error, [StackTrace? stackTrace]) {
  FirebaseCrashlytics.instance.recordError(error, stackTrace);
}
