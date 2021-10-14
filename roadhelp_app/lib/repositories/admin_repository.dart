import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/helper/http_helper.dart';

import '/models/admin.dart';

class AdminRepository {
  static final String _url = baseApiUrl + "api/v1/admins/";

  static Future<List<Admin>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<Admin> items = [
      for (var element in responseBody) Admin.fromJson(element)
    ];*/

    return responseBody
        .map<Admin>((element) => Admin.fromJson(element))
        .toList();
  }

  static Future<Admin> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return Admin.fromJson(responseBody);
  }

  static Future<Admin> create(Admin item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return Admin.fromJson(responseBody);
  }

  static Future<Admin> update(Admin item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return Admin.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
