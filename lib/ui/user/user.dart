import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_list_provider.dart';
import '../../static/user_list_result_state.dart';
import 'widget/user_card.dart';
import 'widget/user_error.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
                return Padding(
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
