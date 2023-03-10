import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/widgets.dart';
import 'package:ARshop_App/utils/consts.dart';

class ApiProvider {
  final String baseUrl = 'http://localhost:8080/api/v1/auth/';
  String? jwtToken;

  Future<http.Response> post(String path, BuildContext context,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final requestHeaders = createHeaders(headers);
    final response = await http.post(Uri.parse('$baseUrl$path'),
        headers: requestHeaders, body: jsonEncode(body));
    if (response.statusCode == 401) {
      await refreshToken();
      final refreshedHeaders = createHeaders(headers);
      final refreshedResponse = await http.post(Uri.parse('$baseUrl$path'),
          headers: refreshedHeaders, body: jsonEncode(body));
      return refreshedResponse;
    } else if (response.statusCode == 403) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => Homepage(),
      ));
    }
    return response;
  }

  Map<String, String> createHeaders(Map<String, String>? headers) {
    final Map<String, String> requestHeaders = {};
    if (jwtToken != null) {
      requestHeaders['Authorization'] = 'Bearer $jwtToken';
    }
    if (headers != null) {
      requestHeaders.addAll(headers);
    }
    return requestHeaders;
  }

  Future refreshToken() async {
    final response = await http.post(Uri.parse('$baseUrl/auth/refresh-token'),
        headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      jwtToken = responseBody['access_token'];
    }
  }

  Future login(String username, String password, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/authenticate'),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        jwtToken = responseBody['access_token'];
        print('login success');
      } else {
        print('login Error');
        print(baseUrl);
        print(jwtToken);
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Unable to connect to server.');
    }
  }

  Future register(
      String customerEmail,
      String customerUsername,
      String custonerTel,
      String customerPassword,
      String customerconfrimPassword,
      BuildContext context) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/register'),
        body: {
          'email': customerEmail,
          'username': customerUsername,
          'telephone': custonerTel,
          'password': customerPassword,
          'confrimpassword': customerconfrimPassword
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        jwtToken = responseBody['access_token'];
        print('login success');
      } else {
        print('login Error');
        print(baseUrl);
        print(jwtToken);
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Unable to connect to server.');
    }
  }
}
