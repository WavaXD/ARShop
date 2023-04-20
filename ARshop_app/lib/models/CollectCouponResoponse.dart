import 'dart:convert';

CoullectCouponResponse coullectCouponResponseFromJson(String str) =>
    CoullectCouponResponse.fromJson(json.decode(str));

String coullectCouponResponseToJson(CoullectCouponResponse data) =>
    json.encode(data.toJson());

class CoullectCouponResponse {
  CoullectCouponResponse({
    required this.respondMessage,
  });

  String respondMessage;

  factory CoullectCouponResponse.fromJson(Map<String, dynamic> json) =>
      CoullectCouponResponse(
        respondMessage: json["respondMessage"],
      );

  Map<String, dynamic> toJson() => {
        "respondMessage": respondMessage,
      };
}
