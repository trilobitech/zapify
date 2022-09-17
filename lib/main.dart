import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:is_firebase_test_lab_activated/is_firebase_test_lab_activated.dart';
import 'package:zapify/app/modules.dart';
import 'package:zapify/app/zapify_app.dart';
import 'package:zapify/core/analytics/analytics.dart';
import 'package:zapify/core/firebase.dart';
import 'package:zapify/firebase_options.dart';

void main() {
  Stopwatch? stopwatch = Stopwatch()..start();
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setupApp();

      loadModules();

      analytics.onAppOpened(properties: {
        'start_up_time': (stopwatch?.elapsedMilliseconds ?? 0) / 1000,
      });
      stopwatch = null;

      runApp(const ZapifyApp());
    },
    (error, stack) => crashlytics.recordError(error, stack, fatal: true),
  );
}

Future<void> setupApp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  FlutterError.onError = crashlytics.recordFlutterFatalError;
  
  if (kDebugMode) {
    // for some reason config set on native android not working well
    await Future.wait([
      crashlytics.setCrashlyticsCollectionEnabled(false),
      performance.setPerformanceCollectionEnabled(false),
      analytics.init(false),
    ]);
  } else {
    final bool isFirebaseTestLabActivated =
        await IsFirebaseTestLabActivated.isFirebaseTestLabActivated;
    await analytics.init(!isFirebaseTestLabActivated);
  }
}
