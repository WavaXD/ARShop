import 'dart:convert';

List<GetProductInCartRequest> getProductInCartRequestFromJson(String str) =>
    List<GetProductInCartRequest>.from(
        json.decode(str).map((x) => GetProductInCartRequest.fromJson(x)));

String getProductInCartRequestToJson(List<GetProductInCartRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProductInCartRequest {
  GetProductInCartRequest({
    required this.detailId,
    required this.customerId,
    required this.productId,
    required this.variationId,
    required this.orderId,
    required this.vendorId,
    required this.cartId,
    required this.variationQuanity,
  });

  int detailId;
  int customerId;
  int productId;
  int variationId;
  int orderId;
  int vendorId;
  int cartId;
  int variationQuanity;

  factory GetProductInCartRequest.fromJson(Map<String, dynamic> json) =>
      GetProductInCartRequest(
        detailId: json["detailID"],
        customerId: json["customerID"],
        productId: json["productID"],
        variationId: json["variationID"],
        orderId: json["orderID"],
        vendorId: json["vendorID"],
        cartId: json["cartID"],
        variationQuanity: json["variationQuanity"],
      );

  Map<String, dynamic> toJson() => {
        "detailID": detailId,
        "customerID": customerId,
        "productID": productId,
        "variationID": variationId,
        "orderID": orderId,
        "vendorID": vendorId,
        "cartID": cartId,
        "variationQuanity": variationQuanity,
      };
}
