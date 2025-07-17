import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palindrome_app/data/classes/common.dart';

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
        title: Text(AppLocalizations.of(context)!.secondScreen),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.defaultPadding,
          vertical: SSizes.paddingLarge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.welcome},',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
                      : AppLocalizations.of(context)!.noUserSelected,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const UserScreen()),
                child: Text(AppLocalizations.of(context)!.chooseUser),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
