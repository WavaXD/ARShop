import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'api_path.dart';
import 'userModel.dart';

class ApiProcider {
  ApiProcider();
  String endPoint = 'https://fakestoreapi.com/auth';
  Future<http.Response> submit_login(String username, String password) async {
    final url = Uri.parse('$endPoint/login');
    var body = {"mor_2314": username, "83r5^_": password};
    return await http.post(url, body: body);
  }
}
