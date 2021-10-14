import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/admin.dart';
import 'package:roadhelp/repositories/admin_repository.dart';

class AdminProvider with ChangeNotifier {
  final List<Admin> _items = [];

  List<Admin> get items {
    return [..._items];
  }

  Future<List<Admin>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<Admin> _itemsLoaded = await AdminRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  Admin findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(Admin item) async {
    Admin itemResponse = await AdminRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(Admin item) async {
    Admin itemResponse = await AdminRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await AdminRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
