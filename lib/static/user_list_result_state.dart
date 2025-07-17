import '../data/model/user.dart';

sealed class UserListResultState {}

class UserListNoneState extends UserListResultState {}

class UserListLoadingState extends UserListResultState {}

class UserListEmptyState extends UserListResultState {}

class UserListErrorState extends UserListResultState {
  final String error;

  UserListErrorState(this.error);
}

class UserListLoadedState extends UserListResultState {
  final List<User> data;

  UserListLoadedState(this.data);
}
