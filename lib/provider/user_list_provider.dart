import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../static/user_list_result_state.dart';

class UserListProvider extends ChangeNotifier {
  final ApiService _apiService;

  UserListProvider(this._apiService);

  UserListResultState _resultState = UserListNoneState();
  UserListResultState get resultState => _resultState;

  Future<void> fetchUserList() async {
    debugPrint("Fetching user list...");
    try {
      _resultState = UserListLoadingState();
      notifyListeners();

      final result = await _apiService.getUserList();
      debugPrint("User list fetched: ${result.data.length} users");
      _resultState = UserListLoadedState(result.data);
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching user list: $e");
      _resultState = UserListErrorState(e.toString());
      notifyListeners();
    }
  }
}
