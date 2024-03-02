import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData ligthTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
