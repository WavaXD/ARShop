import 'dart:convert';

ProcessOrderRequest processOrderRequestFromJson(String str) =>
    ProcessOrderRequest.fromJson(json.decode(str));

String processOrderRequestToJson(ProcessOrderRequest data) =>
    json.encode(data.toJson());

class ProcessOrderRequest {
  ProcessOrderRequest({
    required this.orderDetails,
    required this.coupon,
    required this.address,
    required this.delivery,
  });

  List<OrderDetail> orderDetails;
  Coupon coupon;
  Address address;
  Delivery delivery;

  factory ProcessOrderRequest.fromJson(Map<String, dynamic> json) =>
      ProcessOrderRequest(
        orderDetails: List<OrderDetail>.from(
            json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
        coupon: Coupon.fromJson(json["coupon"]),
        address: Address.fromJson(json["address"]),
        delivery: Delivery.fromJson(json["delivery"]),
      );

  Map<String, dynamic> toJson() => {
        "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "coupon": coupon.toJson(),
        "address": address.toJson(),
        "delivery": delivery.toJson(),
      };
}

class Address {
  Address({
    required this.addressId,
  });

  int addressId;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressId: json["addressID"],
      );

  Map<String, dynamic> toJson() => {
        "addressID": addressId,
      };
}

class Coupon {
  Coupon({
    required this.couponId,
    required this.vendorId,
    required this.discountValue,
    required this.maxDiscount,
    required this.expireDate,
  });

  int couponId;
  int vendorId;
  int discountValue;
  int maxDiscount;
  DateTime expireDate;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        couponId: json["couponID"],
        vendorId: json["vendorID"],
        discountValue: json["discountValue"],
        maxDiscount: json["maxDiscount"],
        expireDate: DateTime.parse(json["expireDate"]),
      );

  Map<String, dynamic> toJson() => {
        "couponID": couponId,
        "vendorID": vendorId,
        "discountValue": discountValue,
        "maxDiscount": maxDiscount,
        "expireDate": expireDate.toIso8601String(),
      };
}

class Delivery {
  Delivery({
    required this.deliveryCo,
    required this.deliveryCost,
  });

  String deliveryCo;
  int deliveryCost;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        deliveryCo: json["deliveryCo"],
        deliveryCost: json["deliveryCost"],
      );

  Map<String, dynamic> toJson() => {
        "deliveryCo": deliveryCo,
        "deliveryCost": deliveryCost,
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
