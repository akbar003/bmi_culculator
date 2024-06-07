import 'package:bmi_culculator/constants/constant.colours.dart';
import 'package:flutter/material.dart';

ThemeData myLightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey,
    foregroundColor: Colors.white,
  ),

  scaffoldBackgroundColor: Colors.grey[300],
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(Colors.grey),
  ),
);

  ThemeData myDarkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: kPinkColor,
      foregroundColor: Colors.white,
    ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(kPinkColor),
  ),
  );