import '/config/constants.dart';
import '/helper/http_helper.dart';
import '/models/user.dart';

class UserRepository {
  static const String _url = baseApiUrl + "api/v1/users/";

  static Future<List<User>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<User> items = [
      for (var element in responseBody) User.fromJson(element)
    ];*/

    return responseBody.map<User>((element) => User.fromJson(element)).toList();
  }

  static Future<User> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return User.fromJson(responseBody);
  }

  static Future<User> create(User item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return User.fromJson(responseBody);
  }

  static Future<User> update(User item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return User.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }
}
