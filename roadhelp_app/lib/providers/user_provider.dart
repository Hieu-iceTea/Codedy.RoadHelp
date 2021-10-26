import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/repositories/user_repository.dart';

import 'auth_provider.dart';

class UserProvider with ChangeNotifier {
  List<User> _items = [];

  final AuthProvider? authProvider;

  UserProvider(this.authProvider, this._items);

  List<User> get items {
    return [..._items];
  }

  Future<List<User>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<User> _itemsLoaded = await UserRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  User findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(User item) async {
    User itemResponse = await UserRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(User item) async {
    User itemResponse = await UserRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await UserRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
