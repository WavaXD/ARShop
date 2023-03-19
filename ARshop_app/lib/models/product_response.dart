import 'dart:convert';

List<dynamic> productDetaillResponseFromJson(String str) =>
    List<dynamic>.from(json.decode(str).map((x) => x));

String productDetaillResponseToJson(List<dynamic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

class ProductDetaillResponseClass {
  ProductDetaillResponseClass({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productQuanity,
    required this.productDetail,
    required this.vendorId,
    required this.productReach,
    required this.soldQuanity,
  });

  int productId;
  String productName;
  int productPrice;
  int productQuanity;
  String productDetail;
  int vendorId;
  int productReach;
  int soldQuanity;

  factory ProductDetaillResponseClass.fromJson(Map<String, dynamic> json) =>
      ProductDetaillResponseClass(
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
