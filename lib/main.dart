import 'package:flutter/material.dart';
import 'package:zapfy/app/modules.dart';
import 'package:zapfy/app/zapfy_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  loadModules();
  runApp(const ZapfyApp());
}
