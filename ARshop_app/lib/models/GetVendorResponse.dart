import 'dart:convert';

GetVendorResponse getVendorResponseFromJson(String str) =>
    GetVendorResponse.fromJson(json.decode(str));

String getVendorResponseToJson(GetVendorResponse data) =>
    json.encode(data.toJson());

class GetVendorResponse {
  GetVendorResponse({
    required this.vendorId,
    this.vendorEmail,
    this.vendorPassword,
    required this.vendorName,
    required this.vendorTel,
  });

  int vendorId;
  dynamic vendorEmail;
  dynamic vendorPassword;
  String vendorName;
  String vendorTel;

  factory GetVendorResponse.fromJson(Map<String, dynamic> json) =>
      GetVendorResponse(
        vendorId: json["vendorID"],
        vendorEmail: json["vendorEmail"],
        vendorPassword: json["vendorPassword"],
        vendorName: json["vendorName"],
        vendorTel: json["vendorTel"],
      );

  Map<String, dynamic> toJson() => {
        "vendorID": vendorId,
        "vendorEmail": vendorEmail,
        "vendorPassword": vendorPassword,
        "vendorName": vendorName,
        "vendorTel": vendorTel,
      };
}
