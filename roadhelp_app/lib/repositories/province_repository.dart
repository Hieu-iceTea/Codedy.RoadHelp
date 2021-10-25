import 'package:roadhelp/models/province.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class ProvinceRepository {
  static const String _url = baseApiUrl + "api/v1/provinces/";

  static Future<List<Province>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<Province> items = [
      for (var element in responseBody) Province.fromJson(element)
    ];*/

    return responseBody
        .map<Province>((element) => Province.fromJson(element))
        .toList();
  }

  static Future<Province> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return Province.fromJson(responseBody);
  }

  static Future<Province> create(Province item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return Province.fromJson(responseBody);
  }

  static Future<Province> update(Province item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return Province.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
