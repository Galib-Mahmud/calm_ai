import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'DM Serif Display',

    primarySwatch: Colors.orange,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: Colors.black54),
    ),
  );
}
