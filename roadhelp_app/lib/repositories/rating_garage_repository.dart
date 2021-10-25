import 'package:roadhelp/models/rating_garage.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class RatingGarageRepository {
  static const String _url = baseApiUrl + "api/v1/ratingGarages/";

  static Future<List<RatingGarage>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<RatingGarage> items = [
      for (var element in responseBody) RatingGarage.fromJson(element)
    ];*/

    return responseBody
        .map<RatingGarage>((element) => RatingGarage.fromJson(element))
        .toList();
  }

  static Future<RatingGarage> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return RatingGarage.fromJson(responseBody);
  }

  static Future<RatingGarage> create(RatingGarage item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return RatingGarage.fromJson(responseBody);
  }

  static Future<RatingGarage> update(RatingGarage item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return RatingGarage.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
