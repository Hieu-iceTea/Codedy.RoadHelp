import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpHelper {
  static String accessToken = "";

  static Map<String, String> get _authHeader {
    return {
      'Authorization': 'Bearer ' + accessToken,
    };
  }

  static Future<dynamic> get({required String url}) async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          ..._authHeader,
        },
      );

      if (response.body.isEmpty) {
        throw const HttpException(
            '❌ Failed to fetch all data. ResponseBody is Empty');
      }

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, then parse the JSON.
        //return json.decode(response.body); //dùng cách mặc định này bị lỗi font utf8
        //return json.decode(const Utf8Decoder().convert(response.bodyBytes)); //cách này cũng tạm ok
        return json.decode(utf8.decode(response.bodyBytes)); //cách này gọn nhất
      } else {
        // If the server did not return a 200 OK response, then throw an exception.
        throw HttpException('❌ Failed to fetch all data. \nStatusCode: ' +
            response.statusCode.toString() +
            "\nMessage: " +
            (json.decode(response.body)['message'] ?? ""));
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<dynamic> post({required String url, Object? body}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json',
          ..._authHeader,
        },
        body: body,
      );

      if (response.body.isEmpty) {
        throw const HttpException('❌ Failed. ResponseBody is Empty');
      }

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw HttpException('❌ Error. \nStatusCode: ' +
            response.statusCode.toString() +
            "\nMessage: " +
            (json.decode(response.body)['message'] ?? ""));
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<dynamic> put({required String url, Object? body}) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json',
          ..._authHeader,
        },
        body: body,
      );

      if (response.body.isEmpty) {
        throw const HttpException('❌ Failed. ResponseBody is Empty');
      }

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw HttpException('❌ Error. \nStatusCode: ' +
            response.statusCode.toString() +
            "\nMessage: " +
            (json.decode(response.body)['message'] ?? ""));
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<dynamic> delete({required String url}) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json',
          ..._authHeader,
        },
      );

      if (response.body.isEmpty) {
        throw const HttpException('❌ Failed. ResponseBody is Empty');
      }

      if (response.statusCode >= 400) {
        throw HttpException('❌ Could not delete item. \nStatusCode: ' +
            response.statusCode.toString() +
            "\nMessage: " +
            (json.decode(response.body)['message'] ?? ""));
      }

      return response.body;
    } catch (error) {
      rethrow;
    }
  }
}
