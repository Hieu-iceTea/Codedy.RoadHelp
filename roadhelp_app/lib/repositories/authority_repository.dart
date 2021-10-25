import 'package:roadhelp/models/authority.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class AuthorityRepository {
  static const String _url = baseApiUrl + "api/v1/authorities/";

  static Future<List<Authority>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<Authorities> items = [
      for (var element in responseBody) Authorities.fromJson(element)
    ];*/

    return responseBody
        .map<Authority>((element) => Authority.fromJson(element))
        .toList();
  }

  static Future<Authority> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return Authority.fromJson(responseBody);
  }

  static Future<Authority> create(Authority item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return Authority.fromJson(responseBody);
  }

  static Future<Authority> update(Authority item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return Authority.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
