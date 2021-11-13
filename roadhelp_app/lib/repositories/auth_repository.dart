import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/models/user.dart';

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

  static Future<Auth> signup(Auth item) async {
    var responseBody = await HttpHelper.post(
      url: _url + "signup",
      body: item.toJson(),
    );

    return Auth.fromJson(responseBody);
  }

  //#region - Extend -
  static Future<Auth> becomeToPartner(int userMemberId) async {
    var responseBody = await HttpHelper.post(
      url: _url + "become-to-partner/" + userMemberId.toString(),
      //body: null,
    );

    return Auth.fromJson(responseBody);
  }

  static Future<Auth> becomeToPartnerVerification(
      int userMemberId, String verificationPartnerCode) async {
    var responseBody = await HttpHelper.post(
      url: _url +
          "become-to-partner/" +
          userMemberId.toString() +
          "/verification/" +
          verificationPartnerCode,
      //body: null,
    );

    return Auth.fromJson(responseBody);
  }

  // Admin - Làm tạm
  static Future<Auth> adminConfirmBecomeToPartner(int userMemberId) async {
    var responseBody = await HttpHelper.post(
      url: _url + "confirm-become-to-partner/" + userMemberId.toString(),
      //body: null,
    );

    return Auth.fromJson(responseBody);
  }

  // Admin - Làm tạm
  static Future<List<User>> findAllUserRequestBecomePartner() async {
    var responseBody = await HttpHelper.get(
      url: _url + "userRequestBecomePartner",
    );

    return responseBody.map<User>((element) => User.fromJson(element)).toList();
  }
//#endregion
}
