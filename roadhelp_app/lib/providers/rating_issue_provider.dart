import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/rating_issue.dart';
import 'package:roadhelp/repositories/rating_issue_repository.dart';

import 'auth_provider.dart';

class RatingIssueProvider with ChangeNotifier {
  List<RatingIssue> _items = [];

  final AuthProvider? authProvider;

  RatingIssueProvider(this.authProvider, this._items);

  List<RatingIssue> get items {
    return [..._items];
  }

  Future<List<RatingIssue>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<RatingIssue> _itemsLoaded = await RatingIssueRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  RatingIssue findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(RatingIssue item) async {
    RatingIssue itemResponse = await RatingIssueRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(RatingIssue item) async {
    RatingIssue itemResponse = await RatingIssueRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await RatingIssueRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
