import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/ward.dart';
import 'package:roadhelp/repositories/ward_repository.dart';

import 'auth_provider.dart';

class WardProvider with ChangeNotifier {
  List<Ward> _items = [];

  final AuthProvider? authProvider;

  WardProvider(this.authProvider, this._items);

  List<Ward> get items {
    return [..._items];
  }

  Future<List<Ward>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<Ward> _itemsLoaded = await WardRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  Ward findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(Ward item) async {
    Ward itemResponse = await WardRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(Ward item) async {
    Ward itemResponse = await WardRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await WardRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
