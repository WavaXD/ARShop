import 'dart:convert';

LoginResponse loginResponseJson(String str) =>
    LoginResponse.fromJson(jsonDecode(str));

class LoginResponse {
  String token;

  LoginResponse({required this.token});

  LoginResponse.fromJson(Map<String, dynamic> json)
      : token = json['token'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
