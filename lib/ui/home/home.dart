import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/sizes.dart';
import '../welcome/welcome.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultPadding),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Lottie.asset('assets/user-add.json'),
              ),
              const SizedBox(height: SSizes.spaceBtwSection),

              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              TextFormField(
                controller: controller.palindromeController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: 'Palindrome',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Palindrome tidak boleh kosong";
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
                  child: const Text('CHECK'),
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(
                        () => WelcomeScreen(userName: controller.userName),
                      );
                    }
                  },
                  child: const Text('NEXT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
