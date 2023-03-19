import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/widgets.dart';
import 'package:ARshop_App/utils/consts.dart';

class ApiProvider {
  // final String baseUrl = 'http://localhost:8080/api/v1/auth/';
  final String baseUrl = 'http://43.206.161.98:8080/api/v1/auth';
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
      // update jwtToken with the refreshed token if it was refreshed
      jwtToken = JwtDecoder.decode(jwtToken!)['access_token'];
      requestHeaders['Authorization'] = 'Bearer $jwtToken';
    }
    if (headers != null) {
      requestHeaders.addAll(headers);
    }
    return requestHeaders;
  }

//for refreshToken
  Future refreshToken() async {
    final response = await http.post(Uri.parse('$baseUrl/auth/refresh-token'),
        headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      jwtToken = responseBody['access_token'];
    }
  }

//check-for-token-expired
  bool isTokenExpired() {
    if (jwtToken != null) {
      return JwtDecoder.isExpired(jwtToken!);
    }
    return true;
  }

//for login
  Future login(String username, String password, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/authenticate'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {'customerEmail': username, 'customerPassword': password}),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        jwtToken = responseBody['token'];

        return jwtToken;
      } else {
        print(baseUrl);
        print(jwtToken);
        return jwtToken;
      }
    } catch (e) {
      print('Error: $e');

      throw Exception('Unable to connect to server.');
    }
  }

//for register
  Future register(
      String customerEmail,
      String customerName,
      String customerTel,
      String customerPassword,
      String customerconfirmPassword,
      String customerGender,
      String customerBirthdate,
      BuildContext context) async {
    try {
      var httpUri;
      final response = await http.post(
        httpUri = Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'customerEmail': customerEmail,
          'customerPassword': customerPassword,
          'customerConfirmPassword': customerconfirmPassword,
          'customerName': customerName,
          'customerTel': customerTel,
          'customerGender': customerGender,
          'customerBirthdate': customerBirthdate,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        jwtToken = responseBody['token'];
        print('register success');
        print(httpUri);
        print(jwtToken);
        print(response.body);
        return jwtToken;
      } else {
        print('Register Error');
        print(httpUri);
        print(jwtToken);
        return jwtToken;
      }
    } catch (e) {
      print('Error: $e');
      print(jwtToken);
      print(baseUrl);
      throw Exception('Unable to connect to server.');
    }
  }

//for ads-slide
  Future<List<String>> getSlideImages(String slideId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/slides/$slideId/images'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<String> images =
          (data['images'] as List).map((e) => e.toString()).toList();
      return images;
    } else {
      throw Exception('Failed to load slide images');
    }
  }
}
