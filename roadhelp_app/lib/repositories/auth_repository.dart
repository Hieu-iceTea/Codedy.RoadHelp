import 'package:roadhelp/models/auth.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class AuthRepository {
  /// NOTE: Phần này chỉ phục vụ xác thực, không phải là entity model có thật trong database

  static const String _url = baseApiUrl + "auth/";

  static Future<Auth> login(Auth item) async {
    var responseBody = await HttpHelper.post(
      url: _url + "login",
      body: item.toJson(),
    );

    return Auth.fromJson(responseBody);
  }

  /*static Future<Auth> signup(Auth item) async {
    var responseBody = await HttpHelper.post(
      url: _url + "signup",
      body: item.toJson(),
    );

    return Auth.fromJson(responseBody);
  }*/
}
