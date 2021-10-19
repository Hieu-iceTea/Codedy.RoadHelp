import 'package:roadhelp/models/issues.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class IssuesRepository {
  static final String _url = baseApiUrl + "api/v1/issueses/";

  static Future<List<Issues>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<Issues> items = [
      for (var element in responseBody) Issues.fromJson(element)
    ];*/

    return responseBody
        .map<Issues>((element) => Issues.fromJson(element))
        .toList();
  }

  static Future<Issues> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return Issues.fromJson(responseBody);
  }

  static Future<Issues> create(Issues item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return Issues.fromJson(responseBody);
  }

  static Future<Issues> update(Issues item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return Issues.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}