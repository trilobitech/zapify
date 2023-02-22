import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:is_firebase_test_lab_activated/is_firebase_test_lab_activated.dart';
import 'package:logger_plus/logger_plus.dart';

import 'app.dart';
import 'common/config/env_config.dart';
import 'common/domain/error.dart';
import 'common/services/firebase.dart';
import 'firebase_options.dart';
import 'modules.dart';

void main() async {
  Stopwatch? stopwatch = Stopwatch()..start();
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setupApp();

      unawaited(loadModules());

      analytics.onAppOpened(
        properties: {
          'start_up_time': (stopwatch?.elapsedMilliseconds ?? 0) / 1000,
        },
      );
      stopwatch = null;

      runApp(const App());
    },
    Log.f,
  );
}

Future<void> setupApp() async {
  FlutterError.onError = Log.f;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (!kDebugMode) {
    Log.plant(_CrashlyticsTree());
  }

  if (kDebugMode) {
    // for some reason config set on native android not working well
    await Future.wait([
      crashlytics.setCrashlyticsCollectionEnabled(false),
      performance.setPerformanceCollectionEnabled(false),
      initAnalytics(amplitudeKey: EnvConfig.amplitudeKey, isEnabled: false),
    ]);
  } else {
    final bool isFirebaseTestLabActivated =
        await IsFirebaseTestLabActivated.isFirebaseTestLabActivated;
    await initAnalytics(
      amplitudeKey: EnvConfig.amplitudeKey,
      isEnabled: !isFirebaseTestLabActivated,
    );
  }
}

class _CrashlyticsTree extends DebugTree {
  @override
  void log(
    Level level,
    String tag,
    dynamic message, [
    StackTrace? stackTrace,
  ]) async {
    if (level.isError && message is! NonReportableError) {
      await crashlytics.recordError(
        message,
        stackTrace,
        fatal: level == Level.fatal,
      );
    }
  }
}
