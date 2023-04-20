import 'dart:convert';

List<GetCouponShow> getCouponShowFromJson(String str) =>
    List<GetCouponShow>.from(
        json.decode(str).map((x) => GetCouponShow.fromJson(x)));

String getCouponShowToJson(List<GetCouponShow> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCouponShow {
  GetCouponShow({
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

  factory GetCouponShow.fromJson(Map<String, dynamic> json) => GetCouponShow(
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
