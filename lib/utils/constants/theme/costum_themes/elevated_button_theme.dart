import 'package:flutter/material.dart';

import '../../colors.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: SColors.white,
      backgroundColor: SColors.primaryColor,
      disabledForegroundColor: SColors.grey,
      disabledBackgroundColor: SColors.grey,
      side: const BorderSide(color: SColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(
        fontSize: 16,
        color: SColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: SColors.white,
      backgroundColor: SColors.primaryColor,
      disabledForegroundColor: SColors.grey,
      disabledBackgroundColor: SColors.grey,
      side: const BorderSide(color: SColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(
        fontSize: 16,
        color: SColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
