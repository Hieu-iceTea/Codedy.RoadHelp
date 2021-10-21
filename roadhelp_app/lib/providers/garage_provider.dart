import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/repositories/garage_repository.dart';

class GarageProvider with ChangeNotifier {
  final List<Garage> _items = [];

  List<Garage> get items {
    return [..._items];
  }

  Future<List<Garage>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<Garage> _itemsLoaded = await GarageRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  Garage findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(Garage item) async {
    //Garage itemResponse = await GarageRepository.create(item);
    _items.add(item);
    notifyListeners();
  }

  Future<void> update(Garage item) async {
    //Garage itemResponse = await GarageRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = item;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await GarageRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
