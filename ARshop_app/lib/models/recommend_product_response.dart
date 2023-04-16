import 'dart:convert';

List<RecommendProductResponse> recommendProductResponseFromJson(String str) =>
    List<RecommendProductResponse>.from(
        json.decode(str).map((x) => RecommendProductResponse.fromJson(x)));

String recommendProductResponseToJson(List<RecommendProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecommendProductResponse {
  RecommendProductResponse({
    required this.productId,
    required this.productName,
    // required this.productPrice,
    // required this.productQuanity,
    this.productDetail,
    required this.vendorId,
    required this.productReach,
    required this.soldQuanity,
  });

  int productId;
  String productName;
  // int productPrice;
  // int productQuanity;
  dynamic productDetail;
  int vendorId;
  int productReach;
  int soldQuanity;

  factory RecommendProductResponse.fromJson(Map<String, dynamic> json) =>
      RecommendProductResponse(
        productId: json["productID"],
        productName: json["productName"],
        // productPrice: json["productPrice"],
        // productQuanity: json["productQuanity"],
        productDetail: json["productDetail"],
        vendorId: json["vendorID"],
        productReach: json["productReach"],
        soldQuanity: json["soldQuanity"],
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
        "productName": productName,
        // "productPrice": productPrice,
        // "productQuanity": productQuanity,
        "productDetail": productDetail,
        "vendorID": vendorId,
        "productReach": productReach,
        "soldQuanity": soldQuanity,
      };
}
