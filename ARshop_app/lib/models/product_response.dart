import 'dart:convert';

List<dynamic> productDetailResponseFromJson(String str) =>
    List<dynamic>.from(json.decode(str).map((x) => x));

String productDetailResponseToJson(List<dynamic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

class PurpleProductDetailResponse {
  PurpleProductDetailResponse({
    required this.modelId,
    required this.variationId,
    required this.modelName,
  });

  int modelId;
  int variationId;
  String modelName;

  factory PurpleProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      PurpleProductDetailResponse(
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

class FluffyProductDetailResponse {
  FluffyProductDetailResponse({
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

  factory FluffyProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      FluffyProductDetailResponse(
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

class TentacledProductDetailResponse {
  TentacledProductDetailResponse({
    required this.productId,
    this.productName,
    this.productDetail,
    this.vendorId,
    this.productReach,
    this.soldQuanity,
    this.pictureId,
    this.pictureName,
  });

  int productId;
  String? productName;
  dynamic productDetail;
  int? vendorId;
  int? productReach;
  int? soldQuanity;
  int? pictureId;
  String? pictureName;

  factory TentacledProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      TentacledProductDetailResponse(
        productId: json["productID"],
        productName: json["productName"],
        productDetail: json["productDetail"],
        vendorId: json["vendorID"],
        productReach: json["productReach"],
        soldQuanity: json["soldQuanity"],
        pictureId: json["pictureID"],
        pictureName: json["pictureName"],
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
        "productName": productName,
        "productDetail": productDetail,
        "vendorID": vendorId,
        "productReach": productReach,
        "soldQuanity": soldQuanity,
        "pictureID": pictureId,
        "pictureName": pictureName,
      };
}
