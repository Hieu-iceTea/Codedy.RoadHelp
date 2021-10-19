import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/authorities.dart';
import 'package:roadhelp/repositories/authority_repository.dart';

class AuthorityProvider with ChangeNotifier {
  final List<Authorities> _items = [];

  List<Authorities> get items {
    return [..._items];
  }

  Future<List<Authorities>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<Authorities> _itemsLoaded = await AuthorityRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  Authorities findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(Authorities item) async {
    Authorities itemResponse = await AuthorityRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(Authorities item) async {
    Authorities itemResponse = await AuthorityRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await AuthorityRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
