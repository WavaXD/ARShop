import 'dart:convert';

ProductDetaillrequest productDetaillrequestFromJson(String str) =>
    ProductDetaillrequest.fromJson(json.decode(str));

String productDetaillrequestToJson(ProductDetaillrequest data) =>
    json.encode(data.toJson());

class ProductDetaillrequest {
  ProductDetaillrequest({
    required this.productId,
  });

  int productId;

  factory ProductDetaillrequest.fromJson(Map<String, dynamic> json) =>
      ProductDetaillrequest(
        productId: json["productID"],
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
      };
}
