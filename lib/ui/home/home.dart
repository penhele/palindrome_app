import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/sizes.dart';
import '../second.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultPadding),
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
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              TextFormField(
                controller: controller.palindromeController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: 'Palindrome',
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwSection),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkPalindrome(context),
                  child: const Text('CHECK'),
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const SecondScreen()),
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
