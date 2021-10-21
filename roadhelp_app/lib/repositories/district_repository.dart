import 'package:roadhelp/models/district.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class DistrictRepository {
  static final String _url = baseApiUrl + "api/v1/districts/";

  static Future<List<District>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<District> items = [
      for (var element in responseBody) District.fromJson(element)
    ];*/

    return responseBody
        .map<District>((element) => District.fromJson(element))
        .toList();
  }

  static Future<List<District>> findAllByProvinceId(int provinceId) async {
    var responseBody = await HttpHelper.get(
      url: _url + "?provinceId=" + provinceId.toString(),
    );

    return responseBody
        .map<District>((element) => District.fromJson(element))
        .toList();
  }

  static Future<District> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return District.fromJson(responseBody);
  }

  static Future<District> create(District item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return District.fromJson(responseBody);
  }

  static Future<District> update(District item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return District.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
