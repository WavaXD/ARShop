import 'dart:convert';

import 'package:ARshop_App/api/config.dart';
import 'package:ARshop_App/models/login_request.dart';
import 'package:ARshop_App/models/login_response.dart';
import 'package:ARshop_App/models/register_request.dart';
import 'package:ARshop_App/models/register_response.dart';
import 'package:ARshop_App/service/shared_service.dart';
import 'package:ARshop_App/utils/consts.dart';
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
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
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
      'Authorization': 'Basic ${loginDetails!.token}'
    };
    var url = Uri.http(Config_api.apiURL, Config_api.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      //share

      return response.body;
    } else {
      return "";
    }
  }
}
