import 'package:roadhelp/models/ward.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class WardRepository {
  static final String _url = baseApiUrl + "api/v1/wards/";

  static Future<List<Ward>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<Ward> items = [
      for (var element in responseBody) Ward.fromJson(element)
    ];*/

    return responseBody.map<Ward>((element) => Ward.fromJson(element)).toList();
  }

  static Future<List<Ward>> findAllByProvinceIdAndDistrictId(
      int provinceId, int districtId) async {
    var responseBody = await HttpHelper.get(
      url: _url +
          "?provinceId=" +
          provinceId.toString() +
          "&districtId=" +
          districtId.toString(),
    );

    /*List<Ward> items = [
      for (var element in responseBody) Ward.fromJson(element)
    ];*/

    return responseBody.map<Ward>((element) => Ward.fromJson(element)).toList();
  }

  static Future<Ward> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return Ward.fromJson(responseBody);
  }

  static Future<Ward> create(Ward item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return Ward.fromJson(responseBody);
  }

  static Future<Ward> update(Ward item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return Ward.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
