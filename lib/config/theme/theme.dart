import 'package:bakery_order_system/config/theme/colorscheme.dart';
import 'package:flutter/material.dart';

enum AppThemeEnum {
  lightTheme,
  darkTheme,
}

class AppThemeData {
  static final appThemeData = {
    AppThemeEnum.lightTheme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        colorScheme: lightColorScheme,
        textTheme: TextTheme(
            titleLarge: TextStyle(
              color: lightTextColors[TextColorEnum.display],
            ),
            labelMedium: TextStyle(color: lightTextColors[TextColorEnum.body]),
            bodyMedium: TextStyle(color: lightTextColors[TextColorEnum.body]))),
    AppThemeEnum.darkTheme: ThemeData()
  };
}
