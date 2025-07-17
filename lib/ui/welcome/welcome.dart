import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/sizes.dart';
import '../user/user.dart';
import '../user/user_controller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.userName});

  final String userName;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? selectedUser;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome,', style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  widget.userName.length > 1
                      ? widget.userName[0].toUpperCase() +
                            widget.userName.substring(1)
                      : widget.userName[0].toUpperCase(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),

            Center(
              child: Obx(
                () => Text(
                  controller.selectedUserName.value.isNotEmpty
                      ? controller.selectedUserName.value
                      : 'No user selected',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const UserScreen()),
                child: const Text('Choose a User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
