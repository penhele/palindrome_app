import 'package:flutter/material.dart';

import '../../colors.dart';

class SAppBarTheme {
  SAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    backgroundColor: SColors.primaryColor,
    iconTheme: IconThemeData(color: SColors.white, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    backgroundColor: SColors.dark,
    iconTheme: IconThemeData(color: SColors.white, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
