import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/rating_garage.dart';
import 'package:roadhelp/repositories/rating_garage_repository.dart';

import 'auth_provider.dart';

class RatingGarageProvider with ChangeNotifier {
  List<RatingGarage> _items = [];

  final AuthProvider? authProvider;

  RatingGarageProvider(this.authProvider, this._items);

  List<RatingGarage> get items {
    return [..._items];
  }

  Future<List<RatingGarage>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<RatingGarage> _itemsLoaded = await RatingGarageRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  RatingGarage findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(RatingGarage item) async {
    RatingGarage itemResponse = await RatingGarageRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(RatingGarage item) async {
    RatingGarage itemResponse = await RatingGarageRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await RatingGarageRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
