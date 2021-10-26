import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/province.dart';
import 'package:roadhelp/repositories/province_repository.dart';

import 'auth_provider.dart';

class ProvinceProvider with ChangeNotifier {
  List<Province> _items = [];

  final AuthProvider? authProvider;

  ProvinceProvider(this.authProvider, this._items);

  List<Province> get items {
    return [..._items];
  }

  Future<List<Province>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<Province> _itemsLoaded = await ProvinceRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  Province findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(Province item) async {
    Province itemResponse = await ProvinceRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(Province item) async {
    Province itemResponse = await ProvinceRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await ProvinceRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
