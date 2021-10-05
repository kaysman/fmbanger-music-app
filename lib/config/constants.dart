import 'package:flutter/material.dart';

class Constants {
  static const String _lastFmApiKey = "7d12dadd689d8eb791e84f28542b6438";
  static const String baseUrl = "http://ws.audioscrobbler.com/2.0/?format=json&api_key=$_lastFmApiKey&";
  static const String _appFontFamily = 'AvenirNextCyr';

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

  static ThemeData darkTheme() {
    final typography = Typography.material2014();

    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: _appPrimarySwatch,
    fontFamily: _appFontFamily,
    typography: typography,
    scaffoldBackgroundColor: const Color(0xff000000),
    indicatorColor: Constants.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
      canvasColor: const Color(0xffeff2f8),
    );
  }
}

