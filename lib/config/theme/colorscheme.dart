import 'package:flutter/material.dart';

enum TextColorEnum {
  display,
  body,
  secondary,
}

const lightColorScheme = ColorScheme.light(
    primary: Color(0xFFF84F39),
    secondary: Colors.blue,
    onBackground: Color(0xFF324155),
    surface: Colors.white,
    background: Color(0xFFC1C1C3));

const lightTextColors = {
  TextColorEnum.display: Color(0xFF324155),
  TextColorEnum.body: Color(0xFF565B65),
  TextColorEnum.secondary: Color(0xFFC1C1C3)
};
