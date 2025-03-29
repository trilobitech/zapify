import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:logify/logify.dart';
import 'package:logify/utils.dart';

import 'app.dart';
import 'common/config/env_config.dart';
import 'common/domain/error.dart';
import 'common/ext/logger.dart';
import 'common/services/firebase.dart';
import 'firebase_options.dart';
import 'modules.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await setupApp();
    unawaited(loadModules());

    runApp(const App());
  }, Log.wtf);
}

Future<void> setupApp() async {
  final completer = Completer();
  FlutterError.onError = Log.wtf;

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  assert(() {
    Log.listen(DebugLogRecorder());
    // for some reason config set on native android not working well
    completer.complete(
      Future.wait([
        crashlytics.setCrashlyticsCollectionEnabled(false),
        performance.setPerformanceCollectionEnabled(false),
        initAnalytics(amplitudeKey: EnvConfig.amplitudeKey, isEnabled: false),
      ]),
    );
    return true;
  }());

  if (kReleaseMode) {
    Logger.root.onRecord.listen(_CrashlyticsTree());
    completer.complete(
      initAnalytics(amplitudeKey: EnvConfig.amplitudeKey, isEnabled: true).catchError(catchErrorLogger),
    );
  }

  await completer.future;
}

class _CrashlyticsTree {
  void call(LogRecord record) {
    if (!record.isSevere || record.error is NonReportableError) return;

    unawaited(
      crashlytics.recordError(record.error ?? record.message, record.stackTrace, fatal: record.level == Level.SHOUT),
    );
  }
}
