import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/sizes.dart';
import 'third.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
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
          children: [
            Text('Welcome,', style: Theme.of(context).textTheme.bodyMedium),
            Text(
              userName.length > 1
                  ? userName[0].toUpperCase() + userName.substring(1)
                  : userName[0].toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const ThirdScreen()),
                child: const Text('Choose a User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
