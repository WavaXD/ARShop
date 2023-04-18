import 'dart:convert';

ProductDetailRequest productDetailRequestFromJson(String str) =>
    ProductDetailRequest.fromJson(json.decode(str));

String productDetailRequestToJson(ProductDetailRequest data) =>
    json.encode(data.toJson());

class ProductDetailRequest {
  ProductDetailRequest({
    required this.productId,
  });

  int productId;

  factory ProductDetailRequest.fromJson(Map<String, dynamic> json) =>
      ProductDetailRequest(
        productId: json["productID"],
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
      };
}
