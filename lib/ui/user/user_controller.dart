import 'package:get/get.dart';

class UserController extends GetxController {
  var selectedUserName = ''.obs;

  void setSelectedUser(String fullName) {
    selectedUserName.value = fullName;
  }
}
