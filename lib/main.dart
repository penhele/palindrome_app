import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'data/api/api_service.dart';
import 'provider/user_list_provider.dart';
import 'ui/home/home.dart';
import 'ui/user/user_controller.dart';
import 'utils/constants/theme/theme.dart';

void main() {
  Get.put(UserController());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserListProvider(ApiService())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
