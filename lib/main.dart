import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
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

      FlutterError.onError = crashlytics.recordFlutterFatalError;

      loadModules();

      runApp(const ZapifyApp());
    },
    (error, stack) => crashlytics.recordError(error, stack, fatal: true),
  );
}
