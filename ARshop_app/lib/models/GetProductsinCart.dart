import 'dart:convert';

List<GetProductInCartResponse> getProductInCartResponseFromJson(String str) =>
    List<GetProductInCartResponse>.from(
        json.decode(str).map((x) => GetProductInCartResponse.fromJson(x)));

String getProductInCartResponseToJson(List<GetProductInCartResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProductInCartResponse {
  GetProductInCartResponse({
    required this.orderDetail,
    required this.price,
  });

  OrderDetail orderDetail;
  int price;

  factory GetProductInCartResponse.fromJson(Map<String, dynamic> json) =>
      GetProductInCartResponse(
        orderDetail: OrderDetail.fromJson(json["orderDetail"]),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "orderDetail": orderDetail.toJson(),
        "price": price,
      };
}

class OrderDetail {
  OrderDetail({
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

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
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
