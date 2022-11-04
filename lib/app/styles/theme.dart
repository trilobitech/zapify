import 'package:flutter/material.dart';

abstract class AppTheme {
  static of(BuildContext context) {
    final theme = Theme.of(context);

    return ThemeData(
      primarySwatch: Colors.teal,
      appBarTheme: theme.appBarTheme.copyWith(
        foregroundColor: Colors.teal,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
