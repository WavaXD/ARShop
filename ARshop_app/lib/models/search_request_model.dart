import 'dart:convert';

SearchModel searchRequestModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchRequestModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.productName,
  });

  String productName;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        productName: json["productName"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
      };
}
