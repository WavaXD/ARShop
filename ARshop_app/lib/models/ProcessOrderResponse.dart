import 'dart:convert';

ProcessOrderResponse processOrderResponseFromJson(String str) =>
    ProcessOrderResponse.fromJson(json.decode(str));

String processOrderResponseToJson(ProcessOrderResponse data) =>
    json.encode(data.toJson());

class ProcessOrderResponse {
  ProcessOrderResponse({
    required this.respondMessage,
  });

  String respondMessage;

  factory ProcessOrderResponse.fromJson(Map<String, dynamic> json) =>
      ProcessOrderResponse(
        respondMessage: json["respondMessage"],
      );

  Map<String, dynamic> toJson() => {
        "respondMessage": respondMessage,
      };
}
