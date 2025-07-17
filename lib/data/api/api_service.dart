import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_response.dart';

class ApiService {
  static const String _baseUrl = "https://reqres.in/api";

  Future<UserResponse> getUserList() async {
    final response = await http.get(Uri.parse("$_baseUrl/users"));

    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load user list: ${response.statusCode}");
    }
  }
}
