import 'dart:convert';

List<GetCouponRequest> getCouponRequestFromJson(String str) =>
    List<GetCouponRequest>.from(
        json.decode(str).map((x) => GetCouponRequest.fromJson(x)));

String getCouponRequestToJson(List<GetCouponRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCouponRequest {
  GetCouponRequest({
    required this.detailId,
    required this.customerId,
    required this.productId,
    required this.variationId,
    required this.orderId,
    required this.vendorId,
    required this.cartId,
    required this.variationQuanity,
  });

  int detailId;
  int customerId;
  int productId;
  int variationId;
  int orderId;
  int vendorId;
  int cartId;
  int variationQuanity;

  factory GetCouponRequest.fromJson(Map<String, dynamic> json) =>
      GetCouponRequest(
        detailId: json["detailID"],
        customerId: json["customerID"],
        productId: json["productID"],
        variationId: json["variationID"],
        orderId: json["orderID"],
        vendorId: json["vendorID"],
        cartId: json["cartID"],
        variationQuanity: json["variationQuanity"],
      );

  Map<String, dynamic> toJson() => {
        "detailID": detailId,
        "customerID": customerId,
        "productID": productId,
        "variationID": variationId,
        "orderID": orderId,
        "vendorID": vendorId,
        "cartID": cartId,
        "variationQuanity": variationQuanity,
      };
}
