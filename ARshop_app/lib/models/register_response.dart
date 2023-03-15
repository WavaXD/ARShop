import 'dart:convert';

RegisterResponseModel registerResponseModel(String str) =>
    RegisterResponseModel.fromJson(jsonDecode(str));

class RegisterResponseModel {
  String token;

  RegisterResponseModel({required this.token});

  RegisterResponseModel.fromJson(Map<String, dynamic> json)
      : token = json['token'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
