import 'package:http/http.dart';

class RegisterRequestModel {
  String customerEmail = '';
  String customerPassword = '';
  String customerConfirmPassword = '';
  String customerName = '';
  String customerTel = '';
  String customerGender = '';
  String customerBirthdate = '';

  RegisterRequestModel(
      {required this.customerEmail,
      required this.customerPassword,
      required this.customerConfirmPassword,
      required this.customerName,
      required this.customerTel,
      required this.customerGender,
      required this.customerBirthdate});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    customerEmail = json['customerEmail'];
    customerPassword = json['customerPassword'];
    customerConfirmPassword = json['customerConfirmPassword'];
    customerName = json['customerName'];
    customerTel = json['customerTel'];
    customerGender = json['customerGender'];
    customerBirthdate = json['customerBirthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerEmail'] = this.customerEmail;
    data['customerPassword'] = this.customerPassword;
    data['customerConfirmPassword'] = this.customerConfirmPassword;
    data['customerName'] = this.customerName;
    data['customerTel'] = this.customerTel;
    data['customerGender'] = this.customerGender;
    data['customerBirthdate'] = this.customerBirthdate;
    return data;
  }
}
