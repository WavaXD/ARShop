import 'dart:convert';

GetProfileResponse getProfileResponseFromJson(String str) =>
    GetProfileResponse.fromJson(json.decode(str));

String getProfileResponseToJson(GetProfileResponse data) =>
    json.encode(data.toJson());

class GetProfileResponse {
  GetProfileResponse({
    required this.name,
    required this.email,
    required this.tel,
  });

  String name;
  String email;
  String tel;

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      GetProfileResponse(
        name: json["name"],
        email: json["email"],
        tel: json["tel"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "tel": tel,
      };
}
