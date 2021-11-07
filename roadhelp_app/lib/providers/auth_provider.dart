import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:roadhelp/helper/http_helper.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/repositories/auth_repository.dart';
import 'package:roadhelp/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  /// NOTE: Phần này chỉ phục vụ xác thực, không phải là entity model có thật trong database

  User _item = User();

  Auth _authData = Auth();
  Timer? _authTimer;
  final String _authDataKey = "Auth_Data";

  Auth get authData {
    return _authData;
  }

  Future<Auth> login(Auth itemRequest) async {
    Auth itemResponse = await AuthRepository.login(itemRequest);
    if (!itemResponse.isAuth) {
      throw Exception("❌ Đăng nhập lỗi");
    }

    _authData = itemResponse;

    notifyListeners();
    _authData.currentUser = await UserRepository.findById(_authData.userId!);

    //Lưu dữ liệu đăng nhập vào SharedPreferences
    if (itemRequest.rememberMe) {
      final authData = _authData.toJson();
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString(_authDataKey, authData);
    }

    _setAutoLogoutTimer();

    //notifyListeners();
    return _authData;
  }

  Future<Auth> signup(Auth item) async {
    Auth itemResponse = await AuthRepository.signup(item);
    _authData = itemResponse;
    notifyListeners();
    return itemResponse;
  }

  Future<Auth> logout() async {
    //xóa thông tin đăng nhập hiện tại trong Provider:
    _authData = Auth();
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }

    notifyListeners();

    //xóa SharedPreferences -> Auth_Data
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(_authDataKey);
    //sharedPreferences.clear();

    return _authData;
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_authDataKey)) {
      return false;
    }

    final extractedAuthData = json.decode(prefs.getString(_authDataKey)!);
    Auth authFromSharedPreferences = Auth.fromJson(extractedAuthData);

    if (authFromSharedPreferences.expiryDate!.isBefore(DateTime.now())) {
      return false;
    }

    _authData = authFromSharedPreferences;

    notifyListeners();
    _authData.currentUser = await UserRepository.findById(_authData.userId!);

    _setAutoLogoutTimer();

    //notifyListeners();
    return true;
  }

  void _setAutoLogoutTimer() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry =
        _authData.expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  @override
  void notifyListeners() {
    if (_authData.isAuth) {
      HttpHelper.accessToken = _authData.accessToken!;
    }

    super.notifyListeners();
  }

  Future<void> updateCurrentUser(User item) async {
    User itemResponse = await UserRepository.update(item);
    _item = itemResponse;
    notifyListeners();

  }

  //#region - Extend -
  Future<Auth> becomeToPartner() async {
    Auth itemResponse =
        await AuthRepository.becomeToPartner(_authData.currentUser!.id!);

    //_authData = itemResponse;

    _authData.message = itemResponse.message;

    //Reload currentUser
    _authData.currentUser = await UserRepository.findById(_authData.userId!);

    notifyListeners();
    return _authData;
  }
//#endregion
}
