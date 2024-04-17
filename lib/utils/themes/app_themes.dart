import 'package:encode_decode/utils/constants/colors.dart';
import 'package:encode_decode/utils/themes/custom_themes/appbar_theme.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  // Light theme
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    useMaterial3: false,
    scaffoldBackgroundColor: CColors.white,
    primaryColor: CColors.primaryLight,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    brightness: Brightness.light,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
  );
  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    useMaterial3: false,
    scaffoldBackgroundColor: CColors.dark,
    primaryColor: CColors.primaryDark,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    brightness: Brightness.dark,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
  );
}