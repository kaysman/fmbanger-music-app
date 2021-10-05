import 'package:flutter/material.dart';

class Constants {
  static const String lastFmApiKey = "7d12dadd689d8eb791e84f28542b6438";
  static const String _appFontFamily = 'Roboto';

  static const Color cardBorder = Color(0xffffffff);
  static const Color primaryColor = Color(0xffff9105);

  static const double verticalPadding = 14.0;
  static const double horizontalPadding = 16.0;
  static const double widgetSpacing = 38.0;

  static const MaterialColor _appPrimarySwatch = MaterialColor(
    0xffff9105,
    <int, Color>{
      50: Color(0xffffc882),
      100: Color(0xffffbd69),
      200: Color(0xffffb250),
      300: Color(0xffffa737),
      400: Color(0xffff9c1e),
      500: Color(0xffff9105),
      600: Color(0xffe68305),
      700: Color(0xffcc7404),
      800: Color(0xffb36604),
      900: Color(0xff995703),
    },
  );

  static ThemeData lightTheme() {
    final typography = Typography.material2014();

    final lightTextTheme = typography.black.apply(
      fontFamily: _appFontFamily,
      displayColor: const Color(0xff161616),
      bodyColor: const Color(0xff161616),
    );

    return ThemeData(
      brightness: Brightness.light,
      fontFamily: _appFontFamily,
      typography: typography,
      textTheme: lightTextTheme,
      primarySwatch: _appPrimarySwatch,
      canvasColor: const Color(0xffeff2f8),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.only(left: 12, right: 8),
        filled: true,
        fillColor: Color(0xffFAFAFA),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff161616),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}

