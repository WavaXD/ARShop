import 'dart:convert';
import 'dart:ffi';

import 'package:ARshop_App/page/login.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:ARshop_App/models/login_response.dart';
import 'package:ARshop_App/models/register_response.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');

    return isKeyExist;
  }

  static Future<LoginResponse?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData('login_details');
      return loginResponseJson(cacheData.syncData);
    }
  }

  static Future<void> setLoginDetails(
    LoginResponse model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: 'login_details',
      syncData: jsonEncode(model.toJson()),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache('login_details');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => Homepage(),
    ));
  }

  static Future<void> clearLoginDetails() async {
    await APICacheManager().deleteCache('login_details');
  }
}
