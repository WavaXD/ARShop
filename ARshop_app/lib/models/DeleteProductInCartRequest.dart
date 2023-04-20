import 'dart:convert';

DeleteProductInCartRequest deleteProductInCartRequestFromJson(String str) =>
    DeleteProductInCartRequest.fromJson(json.decode(str));

String deleteProductInCartRequestToJson(DeleteProductInCartRequest data) =>
    json.encode(data.toJson());

class DeleteProductInCartRequest {
  DeleteProductInCartRequest({
    required this.productId,
    required this.variationId,
    required this.vendorId,
    required this.variationQuanity,
  });

  int productId;
  int variationId;
  int vendorId;
  int variationQuanity;

  factory DeleteProductInCartRequest.fromJson(Map<String, dynamic> json) =>
      DeleteProductInCartRequest(
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
