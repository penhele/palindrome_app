import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/classes/common.dart';
import '../../provider/user_list_provider.dart';
import '../../static/user_list_result_state.dart';
import '../../utils/constants/sizes.dart';
import 'user_controller.dart';
import 'widget/user_card.dart';
import 'widget/user_error.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late ScrollController _scrollController;

  void _fetchUserList() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserListProvider>().fetchUserList(refresh: true);
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _fetchUserList();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      context.read<UserListProvider>().loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.thirdScreen),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.defaultPadding,
          vertical: SSizes.paddingLarge,
        ),
        child: Consumer<UserListProvider>(
          builder: (context, value, child) {
            return switch (value.resultState) {
              UserListLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),

              UserListLoadedState(data: var userList) => RefreshIndicator(
                onRefresh: () async {
                  context.read<UserListProvider>().refreshList();
                },
                child: ListView.separated(
                  controller: _scrollController,
                  itemCount: userList.length + 1,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: SSizes.spaceBtwMenu),
                  itemBuilder: (context, index) {
                    if (index < userList.length) {
                      final user = userList[index];
                      return InkWell(
                        onTap: () {
                          controller.setSelectedUser(
                            '${user.firstName} ${user.lastName}',
                          );
                          Get.back();
                        },
                        child: UserCard(
                          firstName: user.firstName,
                          lastName: user.lastName,
                          email: user.email,
                          avatar: user.avatar,
                          isSelected:
                              controller.selectedUserName.value ==
                                  '${user.firstName} ${user.lastName}'
                              ? true
                              : false,
                        ),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
              ),

              UserListErrorState(error: var msg) => UserErrorState(
                errorMessage: msg,
                onRetry: _fetchUserList,
              ),

              UserListEmptyState() => Center(
                child: Text(AppLocalizations.of(context)!.emptyData),
              ),

              _ => const SizedBox(),
            };
          },
        ),
      ),
    );
  }
}
