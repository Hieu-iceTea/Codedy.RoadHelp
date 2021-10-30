import 'package:flutter/foundation.dart';
import 'package:roadhelp/models/issues.dart';
import 'package:roadhelp/repositories/issues_repository.dart';

import 'auth_provider.dart';

class IssuesProvider with ChangeNotifier {
  List<Issues> _items = [];

  final AuthProvider? authProvider;

  IssuesProvider(this.authProvider, this._items);

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

  //#region - Extend -
  Future<List<Issues>> fetchAllDataByStatusSent() async {
    try {
      List<Issues> _itemsLoaded = await IssuesRepository.findAllByStatusSent();
      _items.clear();
      _items.addAll(_itemsLoaded);
      notifyListeners();
      return _items;
    } catch (error) {
      rethrow;
    }
  }

  Future<String> partnerConfirmMember(Issues item) async {
    String message = await IssuesRepository.partnerConfirmMember(
        item.id!, authProvider!.authData.currentUser!.id!);

    Issues itemReload = findById(item.id!);
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = itemReload;
    notifyListeners();

    return message;
  }

  Future<Issues> send(Issues item) async {
    if (!authProvider!.authData.isAuth) {
      throw Exception(
          "Chưa đăng nhập, hoặc hết thời gian đăng nhập. Vui lòng đăng xuất & đăng nhập lại");
    }

    item.userMember = authProvider!.authData.currentUser;

    Issues itemResponse = await IssuesRepository.send(item);
    _items.add(itemResponse);
    notifyListeners();
    return itemResponse;
  }
//#endregion
}
