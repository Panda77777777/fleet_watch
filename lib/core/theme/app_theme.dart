import 'package:flutter/material.dart';

class AppTheme {
  static const seed = Color(0xFF0B5FA5);

  static ThemeData light() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        useMaterial3: true,
        inputDecorationTheme:
            const InputDecorationTheme(border: OutlineInputBorder()),
      );
}
