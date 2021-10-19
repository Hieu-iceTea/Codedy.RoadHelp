import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/garage_image.dart';
import 'package:roadhelp/repositories/garage_image_repository.dart';

class GarageImageProvider with ChangeNotifier {
  final List<GarageImage> _items = [];

  List<GarageImage> get items {
    return [..._items];
  }

  Future<List<GarageImage>> fetchAllData() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<GarageImage> _itemsLoaded = await GarageImageRepository.findAll();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  GarageImage findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> create(GarageImage item) async {
    GarageImage itemResponse = await GarageImageRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(GarageImage item) async {
    GarageImage itemResponse = await GarageImageRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await GarageImageRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
