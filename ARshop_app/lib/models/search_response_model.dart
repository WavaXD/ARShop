import 'dart:convert';

List<SearchResponseModel> searchResponseModelFromJson(String str) =>
    List<SearchResponseModel>.from(
        json.decode(str).map((x) => SearchResponseModel.fromJson(x)));

String searchResponseModelToJson(List<SearchResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResponseModel {
  SearchResponseModel({
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

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchResponseModel(
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
