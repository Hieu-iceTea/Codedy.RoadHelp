import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/repositories/auth_repository.dart';
import 'package:roadhelp/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  /// NOTE: Phần này chỉ phục vụ xác thực, không phải là entity model có thật trong database

  Auth _item = Auth();
  Timer? _authTimer;
  final String _authDataKey = "Auth_Data";

  Auth get item {
    return _item;
  }

  Future<Auth> login(Auth itemRequest) async {
    Auth itemResponse = await AuthRepository.login(itemRequest);
    if (!itemResponse.isAuth) {
      throw Exception("❌ Đăng nhập lỗi");
    }

    _item = itemResponse;

    _item.currentUser = await UserRepository.findById(_item.userId!);

    //Lưu dữ liệu đăng nhập vào SharedPreferences
    if (itemRequest.rememberMe) {
      final authData = _item.toJson();
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString(_authDataKey, authData);
    }

    _setAutoLogoutTimer();

    notifyListeners();
    return _item;
  }

  Future<Auth> signup(Auth item) async {
    Auth itemResponse = await AuthRepository.signup(item);
    _item = itemResponse;
    notifyListeners();
    return itemResponse;
  }

  Future<Auth> logout() async {
    //xóa thông tin đăng nhập hiện tại trong Provider:
    _item = Auth();
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }

    notifyListeners();

    //xóa SharedPreferences -> Auth_Data
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(_authDataKey);
    //sharedPreferences.clear();

    return _item;
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

    _item = authFromSharedPreferences;

    _item.currentUser = await UserRepository.findById(_item.userId!);

    _setAutoLogoutTimer();

    notifyListeners();
    return true;
  }

  void _setAutoLogoutTimer() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _item.expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
