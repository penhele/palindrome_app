import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../data/classes/common.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../welcome/welcome.dart';
import 'home_controller.dart';
import 'widget.dart/flag_icon_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.firstScreen),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: SSizes.paddingLarge),
            child: FlagIconWidget(),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: SSizes.defaultPadding,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: SColors.grey.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Lottie.asset('assets/user-add.json'),
                      ),
                      const SizedBox(height: SSizes.spaceBtwSection),

                      TextFormField(
                        controller: controller.nameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.direct_right),
                          labelText: AppLocalizations.of(context)!.name,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!.nameRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: SSizes.spaceBtwItems),

                      TextFormField(
                        controller: controller.palindromeController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.direct_right),
                          labelText: AppLocalizations.of(context)!.palindrome,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(
                              context,
                            )!.palindromeRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: SSizes.spaceBtwSection),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.checkPalindrome(context);
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.check),
                        ),
                      ),
                      const SizedBox(height: SSizes.spaceBtwItems),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Get.to(
                                () => WelcomeScreen(
                                  userName: controller.userName,
                                ),
                              );
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.next),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
