import 'package:roadhelp/models/garage.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class GarageRepository {
  static final String _url = baseApiUrl + "api/v1/garages/";

  static Future<List<Garage>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<Garage> items = [
      for (var element in responseBody) Garage.fromJson(element)
    ];*/

    return responseBody
        .map<Garage>((element) => Garage.fromJson(element))
        .toList();
  }

  static Future<Garage> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return Garage.fromJson(responseBody);
  }

  static Future<Garage> create(Garage item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return Garage.fromJson(responseBody);
  }

  static Future<Garage> update(Garage item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return Garage.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}