import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.customerEmail,
    required this.customerPassword,
  });

  String customerEmail;
  String customerPassword;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        customerEmail: json["customerEmail"],
        customerPassword: json["customerPassword"],
      );

  Map<String, dynamic> toJson() => {
        "customerEmail": customerEmail,
        "customerPassword": customerPassword,
      };
}
