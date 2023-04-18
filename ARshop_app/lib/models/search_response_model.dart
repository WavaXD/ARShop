import 'dart:convert';

List<SearchResponseModel> searchResponseModelFromJson(String str) =>
    List<SearchResponseModel>.from(
        json.decode(str).map((x) => SearchResponseModel.fromJson(x)));

String searchResponseModelToJson(List<SearchResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResponseModel {
  SearchResponseModel({
    required this.product,
    required this.price,
  });

  Product product;
  int price;

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchResponseModel(
        product: Product.fromJson(json["product"]),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "price": price,
      };
}

class Product {
  Product({
    required this.productId,
    required this.productName,
    required this.productDetail,
    required this.vendorId,
    required this.productReach,
    required this.soldQuanity,
  });

  int productId;
  String productName;
  String productDetail;
  int vendorId;
  int productReach;
  int soldQuanity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
