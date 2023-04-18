import 'dart:convert';

List<RecommendProductResponse> recommendProductResponseFromJson(String str) =>
    List<RecommendProductResponse>.from(
        json.decode(str).map((x) => RecommendProductResponse.fromJson(x)));

String recommendProductResponseToJson(List<RecommendProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecommendProductResponse {
  RecommendProductResponse({
    required this.product,
    required this.price,
  });

  Product product;
  int price;

  factory RecommendProductResponse.fromJson(Map<String, dynamic> json) =>
      RecommendProductResponse(
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
