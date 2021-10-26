import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/models/garage_image.dart';
import 'package:roadhelp/repositories/garage_image_repository.dart';
import 'package:roadhelp/repositories/garage_repository.dart';

class GarageProvider with ChangeNotifier {
  final List<Garage> _items = [];
  final List<Garage> _itemsByPartner = [];

  List<Garage> get items {
    return [..._items];
  }

  List<Garage> get itemsByPartner {
    return [..._itemsByPartner];
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
    Garage itemResponse = await GarageRepository.create(item);
    _items.add(itemResponse);
    notifyListeners();
  }

  Future<void> update(Garage item) async {
    Garage itemResponse = await GarageRepository.update(item);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemResponse;
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    await GarageRepository.deleteById(id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  //image
  Future<void> createGarageImage(GarageImage garageImage) async {
    GarageImage garageImageResponse = await GarageImageRepository.create(garageImage);
    final index = _items.indexWhere((element) => element.id == garageImage.garageId);
    _items[index].garageImages.add(garageImageResponse);
    notifyListeners();
  }

  Future<void> removeGarageImage(GarageImage garageImage) async {
    await GarageImageRepository.deleteById(garageImage.id!);
    final index = _items.indexWhere((element) => element.id == garageImage.garageId);
    _items[index].garageImages.removeWhere((element) => element.id == garageImage.id);
    notifyListeners();
  }

  //#region - Extend -
  Future<List<Garage>> fetchAllDataByPartner() async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      List<Garage> _itemsLoaded = await GarageRepository.findAllByPartnerId(partnerId: 1); //TODO: Cần sửa lại
      _itemsByPartner.clear();
      _itemsByPartner.addAll(_itemsLoaded);
      notifyListeners();
      return _itemsByPartner;
    } catch (error) {
      rethrow;
    }
  }
  //#endregion
}
