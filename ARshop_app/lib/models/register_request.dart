import 'dart:convert';

RegisterRequestModel registerRequestModelFromJson(String str) =>
    RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) =>
    json.encode(data.toJson());

class RegisterRequestModel {
  RegisterRequestModel({
    required this.customerEmail,
    required this.customerPassword,
    required this.customerConfirmPassword,
    required this.customerName,
    required this.customerTel,
    required this.customerGender,
    required this.customerBirthdate,
  });

  String customerEmail;
  String customerPassword;
  String customerConfirmPassword;
  String customerName;
  String customerTel;
  String customerGender;
  String customerBirthdate;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        customerEmail: json["customerEmail"],
        customerPassword: json["customerPassword"],
        customerConfirmPassword: json["customerConfirmPassword"],
        customerName: json["customerName"],
        customerTel: json["customerTel"],
        customerGender: json["customerGender"],
        customerBirthdate: json["customerBirthdate"],
      );

  Map<String, dynamic> toJson() => {
        "customerEmail": customerEmail,
        "customerPassword": customerPassword,
        "customerConfirmPassword": customerConfirmPassword,
        "customerName": customerName,
        "customerTel": customerTel,
        "customerGender": customerGender,
        "customerBirthdate": customerBirthdate
      };
}
