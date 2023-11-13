library resources;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData light() {
    final base = ThemeData.light();

    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.teal,
      appBarTheme: base.appBarTheme.copyWith(
        foregroundColor: Colors.teal,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.getTextTheme('Archivo', base.textTheme),
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Colors.teal,
        unselectedLabelColor: Colors.blueGrey,
      ),
    );
  }

  static ThemeData dark() {
    final base = ThemeData.dark();

    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.teal,
      primaryColorDark: Colors.teal,
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: base.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: GoogleFonts.getTextTheme('Archivo', base.textTheme),
    );
  }
}
