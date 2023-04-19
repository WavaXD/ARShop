import 'dart:convert';

SearchRequest searchRequestFromJson(String str) =>
    SearchRequest.fromJson(json.decode(str));

String searchRequestToJson(SearchRequest data) => json.encode(data.toJson());

class SearchRequest {
  SearchRequest({
    required this.productName,
  });

  String productName;

  factory SearchRequest.fromJson(Map<String, dynamic> json) => SearchRequest(
        productName: json["productName"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
      };
}
