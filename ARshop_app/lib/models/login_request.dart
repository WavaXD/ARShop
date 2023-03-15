class LoginRequest {
  String customerEmail = '';
  String customerPassword = '';

  LoginRequest({
    required this.customerEmail,
    required this.customerPassword,
  });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    customerEmail = json['customerEmail'];
    customerPassword = json['customerPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerEmail'] = this.customerEmail;
    data['customerPassword'] = this.customerPassword;
    return data;
  }
}
