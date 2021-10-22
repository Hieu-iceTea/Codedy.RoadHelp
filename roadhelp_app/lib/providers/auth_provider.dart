import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  /// NOTE: Phần này chỉ phục vụ xác thực, không phải là entity model có thật trong database

  Auth? _item;

  Auth? get item {
    return _item;
  }

  Future<void> login(Auth item) async {
    Auth itemResponse = await AuthRepository.login(item);
    _item = itemResponse;
    notifyListeners();
  }

  Future<void> signup(Auth item) async {
    Auth itemResponse = await AuthRepository.signup(item);
    _item = itemResponse;
    notifyListeners();
  }
}
