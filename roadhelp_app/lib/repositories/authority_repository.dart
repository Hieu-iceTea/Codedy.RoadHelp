import 'package:roadhelp/models/authorities.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class AuthorityRepository {
  static final String _url = baseApiUrl + "api/v1/authorities/";

  static Future<List<Authorities>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<Authorities> items = [
      for (var element in responseBody) Authorities.fromJson(element)
    ];*/

    return responseBody
        .map<Authorities>((element) => Authorities.fromJson(element))
        .toList();
  }

  static Future<Authorities> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return Authorities.fromJson(responseBody);
  }

  static Future<Authorities> create(Authorities item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return Authorities.fromJson(responseBody);
  }

  static Future<Authorities> update(Authorities item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return Authorities.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
