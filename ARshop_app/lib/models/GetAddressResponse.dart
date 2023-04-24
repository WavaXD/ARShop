import 'dart:convert';

List<GetAddressResponse> getAddressResponseFromJson(String str) =>
    List<GetAddressResponse>.from(
        json.decode(str).map((x) => GetAddressResponse.fromJson(x)));

String getAddressResponseToJson(List<GetAddressResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAddressResponse {
  GetAddressResponse({
    required this.addressId,
    required this.customerId,
    required this.receiverName,
    required this.phone,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.detail,
    required this.getAddressResponseDefault,
    required this.home,
  });

  int addressId;
  int customerId;
  String receiverName;
  String phone;
  String province;
  String district;
  String subDistrict;
  String detail;
  bool getAddressResponseDefault;
  bool home;

  factory GetAddressResponse.fromJson(Map<String, dynamic> json) =>
      GetAddressResponse(
        addressId: json["addressID"],
        customerId: json["customerID"],
        receiverName: json["receiverName"],
        phone: json["phone"],
        province: json["province"],
        district: json["district"],
        subDistrict: json["subDistrict"],
        detail: json["detail"],
        getAddressResponseDefault: json["default"],
        home: json["home"],
      );

  Map<String, dynamic> toJson() => {
        "addressID": addressId,
        "customerID": customerId,
        "receiverName": receiverName,
        "phone": phone,
        "province": province,
        "district": district,
        "subDistrict": subDistrict,
        "detail": detail,
        "default": getAddressResponseDefault,
        "home": home,
      };
}
