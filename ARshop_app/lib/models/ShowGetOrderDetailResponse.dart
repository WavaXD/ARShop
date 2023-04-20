import 'dart:convert';

ShowGetOrdersDetailResponse showGetOrdersDetailResponseFromJson(String str) =>
    ShowGetOrdersDetailResponse.fromJson(json.decode(str));

String showGetOrdersDetailResponseToJson(ShowGetOrdersDetailResponse data) =>
    json.encode(data.toJson());

class ShowGetOrdersDetailResponse {
  ShowGetOrdersDetailResponse({
    required this.productOrder,
    required this.address,
  });

  ProductOrder productOrder;
  Address address;

  factory ShowGetOrdersDetailResponse.fromJson(Map<String, dynamic> json) =>
      ShowGetOrdersDetailResponse(
        productOrder: ProductOrder.fromJson(json["productOrder"]),
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "productOrder": productOrder.toJson(),
        "address": address.toJson(),
      };
}

class Address {
  Address({
    required this.addressId,
    required this.customerId,
    required this.receiverName,
    required this.phone,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.detail,
    required this.addressDefault,
  });

  int addressId;
  int customerId;
  String receiverName;
  String phone;
  String province;
  String district;
  String subDistrict;
  String detail;
  bool addressDefault;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressId: json["addressID"],
        customerId: json["customerId"],
        receiverName: json["receiverName"],
        phone: json["phone"],
        province: json["province"],
        district: json["district"],
        subDistrict: json["subDistrict"],
        detail: json["detail"],
        addressDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "addressID": addressId,
        "customerId": customerId,
        "receiverName": receiverName,
        "phone": phone,
        "province": province,
        "district": district,
        "subDistrict": subDistrict,
        "detail": detail,
        "default": addressDefault,
      };
}

class ProductOrder {
  ProductOrder({
    required this.orderId,
    required this.customerId,
    required this.addressId,
    required this.orderDate,
    this.orderStatus,
    this.trackingNumber,
    required this.vendorId,
    required this.orderPrice,
    required this.deliveryCo,
    required this.deliveryCost,
  });

  int orderId;
  int customerId;
  int addressId;
  DateTime orderDate;
  dynamic orderStatus;
  dynamic trackingNumber;
  int vendorId;
  int orderPrice;
  String deliveryCo;
  int deliveryCost;

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
        orderId: json["orderID"],
        customerId: json["customerID"],
        addressId: json["addressID"],
        orderDate: DateTime.parse(json["orderDate"]),
        orderStatus: json["orderStatus"],
        trackingNumber: json["trackingNumber"],
        vendorId: json["vendorID"],
        orderPrice: json["orderPrice"],
        deliveryCo: json["deliveryCo"],
        deliveryCost: json["deliveryCost"],
      );

  Map<String, dynamic> toJson() => {
        "orderID": orderId,
        "customerID": customerId,
        "addressID": addressId,
        "orderDate": orderDate.toIso8601String(),
        "orderStatus": orderStatus,
        "trackingNumber": trackingNumber,
        "vendorID": vendorId,
        "orderPrice": orderPrice,
        "deliveryCo": deliveryCo,
        "deliveryCost": deliveryCost,
      };
}
