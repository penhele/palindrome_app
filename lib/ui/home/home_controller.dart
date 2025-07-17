import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helpers/string_helper.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  void checkPalindrome(BuildContext context) {
    final result = SStringHelper.isPalindrome(palindromeController.text);

    Future.delayed(const Duration(milliseconds: 100), () {
      AwesomeDialog(
        context: context,
        dialogType: result ? DialogType.success : DialogType.error,
        animType: AnimType.scale,
        title: 'Palindrome Check',
        desc: result ? 'isPalindrome' : 'not palindrome',
        btnOkOnPress: () {},
      ).show();
    });
  }

  String get userName => nameController.text;

  @override
  void onClose() {
    nameController.dispose();
    palindromeController.dispose();
    super.onClose();
  }
}
