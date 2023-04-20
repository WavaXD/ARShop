import 'dart:convert';

List<GetCouponResponse> getCouponResponseFromJson(String str) =>
    List<GetCouponResponse>.from(
        json.decode(str).map((x) => GetCouponResponse.fromJson(x)));

String getCouponResponseToJson(List<GetCouponResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCouponResponse {
  GetCouponResponse({
    required this.couponId,
    required this.vendorId,
    required this.discountValue,
    required this.maxDiscount,
    required this.expireDate,
  });

  int couponId;
  int vendorId;
  int discountValue;
  int maxDiscount;
  DateTime expireDate;

  factory GetCouponResponse.fromJson(Map<String, dynamic> json) =>
      GetCouponResponse(
        couponId: json["couponID"],
        vendorId: json["vendorID"],
        discountValue: json["discountValue"],
        maxDiscount: json["maxDiscount"],
        expireDate: DateTime.parse(json["expireDate"]),
      );

  Map<String, dynamic> toJson() => {
        "couponID": couponId,
        "vendorID": vendorId,
        "discountValue": discountValue,
        "maxDiscount": maxDiscount,
        "expireDate": expireDate.toIso8601String(),
      };
}
