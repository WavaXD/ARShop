import 'dart:convert';

List<ShowGetOrders> showGetOrdersFromJson(String str) =>
    List<ShowGetOrders>.from(
        json.decode(str).map((x) => ShowGetOrders.fromJson(x)));

String showGetOrdersToJson(List<ShowGetOrders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowGetOrders {
  ShowGetOrders({
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

  factory ShowGetOrders.fromJson(Map<String, dynamic> json) => ShowGetOrders(
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
