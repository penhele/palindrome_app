import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation_menu.dart';
import 'utils/constants/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      home: const NavigationMenu(),
    );
  }
}
