import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user_response.dart';

class ApiService {
  static const String _baseUrl = "https://reqres.in/api";

  Future<UserResponse> getUserList({page = 2, perPage = 10}) async {
    final url = Uri.parse("$_baseUrl/users?page=$page&per_page=$perPage");

    final response = await http.get(url);

    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
        "Failed to load user list: ${response.statusCode}\n${response.body}",
      );
    }
  }
}
