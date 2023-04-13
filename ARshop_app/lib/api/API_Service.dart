import 'dart:convert';
import 'package:ARshop_App/api/config.dart';
import 'package:ARshop_App/models/login_request.dart';
import 'package:ARshop_App/models/login_response.dart';
import 'package:ARshop_App/models/recommend_product_response.dart';
import 'package:ARshop_App/models/register_request.dart';
import 'package:ARshop_App/models/register_response.dart';
import 'package:ARshop_App/models/search_request_model.dart';
import 'package:ARshop_App/models/search_response_model.dart';
import 'package:ARshop_App/models/product_request.dart';
import 'package:ARshop_App/models/product_response.dart';
import 'package:ARshop_App/service/shared_service.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/models/popular_product_response.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

//login
  static Future<bool> login(LoginRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config_api.apiURL, Config_api.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      //share
      await SharedService.setLoginDetails(loginResponseFromJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static bool isTokenInvalid(int statusCode) {
    return statusCode == 401 || statusCode == 403;
  }

  static Future<void> clearLoginDetails() async {
    await SharedService.clearLoginDetails();
  }

  static Future<http.Response> performRequest(http.Request request) async {
    var loginDetails = await SharedService.loginDetails();
    if (loginDetails != null) {
      request.headers.addAll({
        'Authorization': 'Bearer ${loginDetails.token}',
      });
    }
    var response = await client.send(request);
    if (isTokenInvalid(response.statusCode)) {
      await clearLoginDetails();
    }
    return http.Response.fromStream(response);
  }

//register
  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config_api.apiURL, Config_api.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }

//logout
  static Future<String> getUserProfile(LoginRequest model) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.token}'
    };
    var url = Uri.http(Config_api.apiURL, Config_api.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  //search
  static Future<List<SearchResponseModel>> getSearchItem(
      SearchModel model) async {
    var url = Uri.http(Config_api.apiURL, Config_api.searchAPI);
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.token}'
    };
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      final responseData = response.body;
      final searchResponseModels = searchResponseModelFromJson(responseData);
      return searchResponseModels;
    } else {
      throw Exception('Failed to search product');
    }
  }

  //product detail
  static Future<ProductDetaillResponseClass> getProductDetails(
      int productId) async {
    var url = Uri.http(Config_api.apiURL, Config_api.productDetailAPI,
        {'product_id': productId.toString()});
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.token}'
    };
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return ProductDetaillResponseClass.fromJson(
          jsonDecode(json.encode(response.body)));
    } else {
      throw Exception('Failed to load product details');
    }
  }

  //get_recommed_product
  static Future<List<RecommendProductResponse>> getRecommendProduct(
      model) async {
    var url = Uri.http(Config_api.apiURL, Config_api.recommendProductAPI);
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.token}'
    };
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      List<RecommendProductResponse> recommendProduct =
          recommendProductResponseFromJson(decodedData);
      return recommendProduct;
    } else {
      throw Exception('Failed to load recommended products');
    }
  }

  //get_popular_product
  static Future<List<PopularProductResponse>> getPopularProduct(
      {required int limit}) async {
    var url = Uri.http(Config_api.apiURL, Config_api.poppularProductAPI);
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.token}'
    };
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      List<PopularProductResponse> popularProducts =
          popularProductResponseFromJson(json.encode(decodedData));
      return popularProducts;
    } else {
      throw Exception(
          'Failed to load popular products ${response.statusCode} ${loginDetails!.token}');
    }
  }
}
