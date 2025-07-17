import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../data/model/user.dart';
import '../static/user_list_result_state.dart';

class UserListProvider extends ChangeNotifier {
  final ApiService _apiService;

  UserListProvider(this._apiService);

  List<User> _users = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  UserListResultState _resultState = UserListNoneState();
  UserListResultState get resultState => _resultState;

  Future<void> fetchUserList({bool refresh = false}) async {
    if (_isLoading) return;

    if (refresh) {
      _currentPage = 1;
      _users.clear();
      _hasMore = true;
      _resultState = UserListLoadingState();
      notifyListeners();
    }

    _isLoading = true;
    try {
      final result = await _apiService.getUserList(page: _currentPage);
      if (result.data.isEmpty) {
        _hasMore = false;
      } else {
        _users.addAll(result.data);
        _currentPage++;
      }

      _resultState = _users.isEmpty
          ? UserListEmptyState()
          : UserListLoadedState(List.from(_users));
    } catch (e) {
      _resultState = UserListErrorState(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void loadMore() {
    if (_hasMore && !_isLoading) {
      fetchUserList();
    }
  }

  void refreshList() {
    fetchUserList(refresh: true);
  }
}
