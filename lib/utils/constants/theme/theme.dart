import 'package:flutter/material.dart';

import '../colors.dart';
import 'costum_themes/appbar_theme.dart';
import 'costum_themes/elevated_button_theme.dart';
import 'costum_themes/text_field_theme.dart';
import 'costum_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: SColors.light,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    textTheme: STextTheme.lightTextTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SColors.backgroundDark,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
    textTheme: STextTheme.darkTextTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.darkInputDecorationTheme,
  );
}
