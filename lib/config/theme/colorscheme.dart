import 'package:flutter/material.dart';

enum TextColorEnum {
  display,
  body,
  secondary,
}

const lightColorScheme = ColorScheme.light(
  primary: Colors.blue,
  secondary: Color(0xFFC1C1C3),
  onBackground: Color(0xFF324155),
);

const lightTextColors = {
  TextColorEnum.display: Color(0xFF324155),
  TextColorEnum.body: Color(0xFF565B65),
  TextColorEnum.secondary: Color(0xFFC1C1C3)
};
