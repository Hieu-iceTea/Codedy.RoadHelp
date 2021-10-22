import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  /// NOTE: Phần này chỉ phục vụ xác thực, không phải là entity model có thật trong database

  Auth _item = Auth();

  Auth get item {
    return _item;
  }

  Future<Auth> login(Auth item) async {
    Auth itemResponse = await AuthRepository.login(item);
    _item = itemResponse;
    notifyListeners();

    //Lưu dữ liệu đăng nhập vào SharedPreferences
    if (item.rememberMe) {
      final authData = itemResponse.toJson();
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('authData', authData);
    }

    return itemResponse;
  }

  Future<Auth> signup(Auth item) async {
    Auth itemResponse = await AuthRepository.signup(item);
    _item = itemResponse;
    notifyListeners();
    return itemResponse;
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('authData')) {
      return false;
    }

    final extractedAuthData = json.decode(prefs.getString('authData')!);
    Auth auth = Auth.fromJson(extractedAuthData);

    if (auth.expiryDate!.isBefore(DateTime.now())) {
      return false;
    }

    _item = auth;
    notifyListeners();
    return true;
  }
}
