import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zapfy/app/modules.dart';
import 'package:zapfy/app/zapfy_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(kReleaseMode);

      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      loadModules();
      runApp(const ZapfyApp());
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}
