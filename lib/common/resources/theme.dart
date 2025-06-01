import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: Colors.teal,
      appBarTheme: const AppBarTheme(foregroundColor: Colors.teal),
    ).common();
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.teal,
    ).common();
  }
}

extension _ThemeDataX on ThemeData {
  ThemeData common() {
    return copyWith(
      textTheme: GoogleFonts.archivoTextTheme(textTheme),
      appBarTheme: appBarTheme.copyWith(
        backgroundColor: scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
