import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider/user_list_provider.dart';
import '../../static/user_list_result_state.dart';
import 'user_controller.dart';
import 'widget/user_card.dart';
import 'widget/user_error.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  void _fetchUserList() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserListProvider>().fetchUserList();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User List',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Consumer<UserListProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            UserListLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),

            UserListLoadedState(data: var userList) => ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];

                return InkWell(
                  onTap: () {
                    controller.setSelectedUser(
                      '${user.firstName} ${user.lastName}',
                    );
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: UserCard(
                      firstName: user.firstName,
                      lastName: user.lastName,
                      email: user.email,
                      avatar: user.avatar,
                    ),
                  ),
                );
              },
            ),

            UserListErrorState(error: var msg) => UserErrorState(
              errorMessage: msg,
              onRetry: _fetchUserList,
            ),

            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
