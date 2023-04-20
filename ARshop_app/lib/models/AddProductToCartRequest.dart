import 'dart:convert';

AddProducttoCartRequest addProducttoCartRequestFromJson(String str) =>
    AddProducttoCartRequest.fromJson(json.decode(str));

String addProducttoCartRequestToJson(AddProducttoCartRequest data) =>
    json.encode(data.toJson());

class AddProducttoCartRequest {
  AddProducttoCartRequest({
    required this.productId,
    required this.variationId,
    required this.vendorId,
    required this.variationQuanity,
  });

  int productId;
  int variationId;
  int vendorId;
  int variationQuanity;

  factory AddProducttoCartRequest.fromJson(Map<String, dynamic> json) =>
      AddProducttoCartRequest(
        productId: json["productID"],
        variationId: json["variationID"],
        vendorId: json["vendorID"],
        variationQuanity: json["variationQuanity"],
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
        "variationID": variationId,
        "vendorID": vendorId,
        "variationQuanity": variationQuanity,
      };
}
