import 'package:roadhelp/models/issue.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class IssueRepository {
  static const String _url = baseApiUrl + "api/v1/issues/";

  static Future<List<Issue>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<Issues> items = [
      for (var element in responseBody) Issues.fromJson(element)
    ];*/

    return responseBody
        .map<Issue>((element) => Issue.fromJson(element))
        .toList();
  }

  static Future<Issue> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return Issue.fromJson(responseBody);
  }

  static Future<Issue> create(Issue item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return Issue.fromJson(responseBody);
  }

  static Future<Issue> update(Issue item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return Issue.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }

  //#region - Extend -
  static Future<List<Issue>> findAllByStatusSent() async {
    var responseBody = await HttpHelper.get(
      url: _url + "byStatusSent",
    );

    return responseBody
        .map<Issue>((element) => Issue.fromJson(element))
        .toList();
  }

  static Future<List<Issue>> findAllByByUserMember(int userMemberId) async {
    var responseBody = await HttpHelper.get(
      url: _url + "byUserMember/$userMemberId",
    );

    return responseBody
        .map<Issue>((element) => Issue.fromJson(element))
        .toList();
  }

  static Future<List<Issue>> findAllByByUserPartner(int userPartnerId) async {
    var responseBody = await HttpHelper.get(
      url: _url + "byUserPartner/$userPartnerId",
    );

    return responseBody
        .map<Issue>((element) => Issue.fromJson(element))
        .toList();
  }

  static Future<String> partnerConfirmMember(
      int issueId, int userPartnerId) async {
    var responseBody = await HttpHelper.put(
      url: _url +
          issueId.toString() +
          "/partner-confirm-member/" +
          userPartnerId.toString(),
      body: null,
    );

    return responseBody['message'];
  }

  static Future<String> memberConfirmPartner(
      int issueId) async {
    var responseBody = await HttpHelper.put(
      url: _url +
          issueId.toString() +
          "/member-confirm-partner",
      body: null,
    );

    return responseBody['message'];
  }

  static Future<Issue> send(Issue item) async {
    var responseBody = await HttpHelper.post(
      url: _url + "send",
      body: item.toJson(),
    );

    return Issue.fromJson(responseBody);
  }
//#endregion
}
