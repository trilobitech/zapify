import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zapify/app/modules.dart';
import 'package:zapify/app/zapify_app.dart';
import 'package:zapify/core/firebase.dart';
import 'package:zapify/firebase_options.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      if (kDebugMode) {
        // for some reason config set on native android not working well
        await Future.wait([
          crashlytics.setCrashlyticsCollectionEnabled(false),
          performance.setPerformanceCollectionEnabled(false),
          analytics.setAnalyticsCollectionEnabled(false),
        ]);
      }

      FlutterError.onError = crashlytics.recordFlutterFatalError;

      loadModules();

      runApp(const ZapifyApp());
    },
    (error, stack) => crashlytics.recordError(error, stack, fatal: true),
  );
}
