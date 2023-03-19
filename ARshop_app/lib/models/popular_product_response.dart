import 'dart:convert';

List<PopularProductResponse> popularProductResponseFromJson(String str) =>
    List<PopularProductResponse>.from(
        json.decode(str).map((x) => PopularProductResponse.fromJson(x)));

String popularProductResponseToJson(List<PopularProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopularProductResponse {
  PopularProductResponse({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productQuanity,
    this.productDetail,
    required this.vendorId,
    required this.productReach,
    required this.soldQuanity,
  });

  int productId;
  String productName;
  int productPrice;
  int productQuanity;
  String? productDetail;
  int vendorId;
  int productReach;
  int soldQuanity;

  factory PopularProductResponse.fromJson(Map<String, dynamic> json) =>
      PopularProductResponse(
        productId: json["productID"],
        productName: json["productName"],
        productPrice: json["productPrice"],
        productQuanity: json["productQuanity"],
        productDetail: json["productDetail"],
        vendorId: json["vendorID"],
        productReach: json["productReach"],
        soldQuanity: json["soldQuanity"],
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
        "productName": productName,
        "productPrice": productPrice,
        "productQuanity": productQuanity,
        "productDetail": productDetail,
        "vendorID": vendorId,
        "productReach": productReach,
        "soldQuanity": soldQuanity,
      };
}
