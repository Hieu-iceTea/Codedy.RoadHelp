import 'package:roadhelp/models/rating_issues.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class RatingIssuesRepository {
  static const String _url = baseApiUrl + "api/v1/ratingIssues/";

  static Future<List<RatingIssues>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<RatingIssues> items = [
      for (var element in responseBody) RatingIssues.fromJson(element)
    ];*/

    return responseBody
        .map<RatingIssues>((element) => RatingIssues.fromJson(element))
        .toList();
  }

  static Future<RatingIssues> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return RatingIssues.fromJson(responseBody);
  }

  static Future<RatingIssues> create(RatingIssues item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return RatingIssues.fromJson(responseBody);
  }

  static Future<RatingIssues> update(RatingIssues item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return RatingIssues.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
