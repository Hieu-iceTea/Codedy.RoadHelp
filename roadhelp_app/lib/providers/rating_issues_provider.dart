import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/rating_issues.dart';
import 'package:roadhelp/repositories/rating_issues_repository.dart';

class RatingIssuesProvider with ChangeNotifier {
  final List<RatingIssues> _items = [];

  List<RatingIssues> get items {
    return [..._items];
  }

  Future<List<RatingIssues>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<RatingIssues> _itemsLoaded = await RatingIssuesRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  RatingIssues findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(RatingIssues item) async {
    RatingIssues itemResponse = await RatingIssuesRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(RatingIssues item) async {
    RatingIssues itemResponse = await RatingIssuesRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await RatingIssuesRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
