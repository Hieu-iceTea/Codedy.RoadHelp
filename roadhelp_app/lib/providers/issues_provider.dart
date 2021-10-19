import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/issues.dart';
import 'package:roadhelp/repositories/issues_repository.dart';

class IssuesProvider with ChangeNotifier {
  final List<Issues> _items = [];

  List<Issues> get items {
    return [..._items];
  }

  Future<List<Issues>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<Issues> _itemsLoaded = await IssuesRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  Issues findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(Issues item) async {
    Issues itemResponse = await IssuesRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(Issues item) async {
    Issues itemResponse = await IssuesRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await IssuesRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
