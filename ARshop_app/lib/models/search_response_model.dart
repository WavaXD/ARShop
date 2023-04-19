import 'dart:convert';

List<SearchResponse> searchResponseFromJson(String str) =>
    List<SearchResponse>.from(
        json.decode(str).map((x) => SearchResponse.fromJson(x)));

String searchResponseToJson(List<SearchResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResponse {
  SearchResponse({
    required this.product,
    required this.price,
    required this.productPicture,
  });

  Product product;
  int price;
  ProductPicture productPicture;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        product: Product.fromJson(json["product"]),
        price: json["price"],
        productPicture: ProductPicture.fromJson(json["productPicture"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "price": price,
        "productPicture": productPicture.toJson(),
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

class ProductPicture {
  ProductPicture({
    required this.pictureId,
    required this.productId,
    required this.pictureName,
  });

  int pictureId;
  int productId;
  String pictureName;

  factory ProductPicture.fromJson(Map<String, dynamic> json) => ProductPicture(
        pictureId: json["pictureID"],
        productId: json["productID"],
        pictureName: json["pictureName"],
      );

  Map<String, dynamic> toJson() => {
        "pictureID": pictureId,
        "productID": productId,
        "pictureName": pictureName,
      };
}
