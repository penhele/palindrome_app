import 'package:flutter/material.dart';

class SDarkModeHelper {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
