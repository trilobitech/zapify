import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zapfy/app/modules.dart';
import 'package:zapfy/app/zapfy_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zapfy/core/firebase.dart';
import 'firebase_options.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FlutterError.onError = crashlytics.recordFlutterFatalError;

      await Future.wait([
        crashlytics.setCrashlyticsCollectionEnabled(kReleaseMode),
        analytics.setAnalyticsCollectionEnabled(kReleaseMode),
        loadModules(),
      ]);

      runApp(const ZapfyApp());
    },
    (error, stack) => crashlytics.recordError(error, stack, fatal: true),
  );
}
