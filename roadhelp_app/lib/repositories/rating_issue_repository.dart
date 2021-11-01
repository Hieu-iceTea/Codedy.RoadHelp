import 'package:roadhelp/models/rating_issue.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class RatingIssueRepository {
  static const String _url = baseApiUrl + "api/v1/ratingIssues/";

  static Future<List<RatingIssue>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<RatingIssues> items = [
      for (var element in responseBody) RatingIssues.fromJson(element)
    ];*/

    return responseBody
        .map<RatingIssue>((element) => RatingIssue.fromJson(element))
        .toList();
  }

  static Future<RatingIssue> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return RatingIssue.fromJson(responseBody);
  }

  static Future<RatingIssue> create(RatingIssue item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return RatingIssue.fromJson(responseBody);
  }

  static Future<RatingIssue> update(RatingIssue item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return RatingIssue.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
