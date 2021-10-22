import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  Auth? _item;

  Auth? get item {
    return _item;
  }

  Future<void> login(Auth item) async {
    Auth itemResponse = await AuthRepository.login(item);
    _item = itemResponse;
    notifyListeners();
  }
}
