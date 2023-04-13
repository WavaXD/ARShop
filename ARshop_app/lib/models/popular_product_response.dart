// To parse this JSON data, do
//
//     final popularProductResponse = popularProductResponseFromJson(jsonString);

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
    this.productDetail,
    required this.vendorId,
    required this.productReach,
    required this.soldQuanity,
  });

  int productId;
  String productName;
  dynamic productDetail;
  int vendorId;
  int productReach;
  int soldQuanity;

  factory PopularProductResponse.fromJson(Map<String, dynamic> json) =>
      PopularProductResponse(
        productId: json["productID"],
        productName: json["productName"],
        productDetail: json["productDetail"],
        vendorId: json["vendorID"],
        productReach: json["productReach"],
        soldQuanity: json["soldQuanity"],
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
        "productName": productName,
        "productDetail": productDetail,
        "vendorID": vendorId,
        "productReach": productReach,
        "soldQuanity": soldQuanity,
      };
}
