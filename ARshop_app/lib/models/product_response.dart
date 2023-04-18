import 'dart:convert';

ProductDetailResponse productDetailResponseFromJson(String str) =>
    ProductDetailResponse.fromJson(json.decode(str));

String productDetailResponseToJson(ProductDetailResponse data) =>
    json.encode(data.toJson());

class ProductDetailResponse {
  ProductDetailResponse({
    required this.product,
    required this.productPicture,
    required this.variationModelContext,
  });

  Product product;
  List<ProductPicture> productPicture;
  List<VariationModelContext> variationModelContext;

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailResponse(
        product: Product.fromJson(json["product"]),
        productPicture: List<ProductPicture>.from(
            json["productPicture"].map((x) => ProductPicture.fromJson(x))),
        variationModelContext: List<VariationModelContext>.from(
            json["variationModelContext"]
                .map((x) => VariationModelContext.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "productPicture":
            List<dynamic>.from(productPicture.map((x) => x.toJson())),
        "variationModelContext":
            List<dynamic>.from(variationModelContext.map((x) => x.toJson())),
      };
}

class Product {
  Product({
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

class VariationModelContext {
  VariationModelContext({
    required this.variation,
    this.model,
  });

  Variation variation;
  Model? model;

  factory VariationModelContext.fromJson(Map<String, dynamic> json) =>
      VariationModelContext(
        variation: Variation.fromJson(json["variation"]),
        model: json["model"] == null ? null : Model.fromJson(json["model"]),
      );

  Map<String, dynamic> toJson() => {
        "variation": variation.toJson(),
        "model": model?.toJson(),
      };
}

class Model {
  Model({
    required this.modelId,
    required this.variationId,
    required this.modelName,
  });

  int modelId;
  int variationId;
  String modelName;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        modelId: json["modelID"],
        variationId: json["variationID"],
        modelName: json["modelName"],
      );

  Map<String, dynamic> toJson() => {
        "modelID": modelId,
        "variationID": variationId,
        "modelName": modelName,
      };
}

class Variation {
  Variation({
    required this.variationId,
    required this.productId,
    required this.variationName,
    required this.variationPrice,
    required this.variationQuanity,
  });

  int variationId;
  int productId;
  String variationName;
  int variationPrice;
  int variationQuanity;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        variationId: json["variationID"],
        productId: json["productID"],
        variationName: json["variationName"],
        variationPrice: json["variationPrice"],
        variationQuanity: json["variationQuanity"],
      );

  Map<String, dynamic> toJson() => {
        "variationID": variationId,
        "productID": productId,
        "variationName": variationName,
        "variationPrice": variationPrice,
        "variationQuanity": variationQuanity,
      };
}
