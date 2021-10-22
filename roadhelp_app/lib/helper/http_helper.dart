import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<dynamic> get({required String url}) async {
    //https://flutter.dev/docs/cookbook/networking/fetch-data
    try {
      final response = await http.get(Uri.parse(url));

      if (response.body.isEmpty) {
        throw Exception('❌ Failed to fetch all data. Response body is Empty');
      }

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, then parse the JSON.
        //return json.decode(response.body); //dùng cách mặc định này bị lỗi font utf8
        //return json.decode(const Utf8Decoder().convert(response.bodyBytes)); //cách này cũng tạm ok
        return json.decode(utf8.decode(response.bodyBytes)); //cách này gọn nhất
      } else {
        // If the server did not return a 200 OK response, then throw an exception.
        throw Exception('❌ Failed to fetch all data. StatusCode: ' +
            response.statusCode.toString());
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<dynamic> post({required String url, Object? body}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'content-type': 'application/json'},
        body: body,
      );

      if (response.body.isEmpty) {
        throw Exception('❌ Failed to fetch all data. Response body is Empty');
      }

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('❌ Failed to fetch all data. StatusCode: ' +
            response.statusCode.toString());
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<dynamic> put({required String url, Object? body}) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {'content-type': 'application/json'},
        body: body,
      );

      if (response.body.isEmpty) {
        throw Exception('❌ Failed to fetch all data. Response body is Empty');
      }

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('❌ Failed to fetch all data. StatusCode: ' +
            response.statusCode.toString());
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<dynamic> delete({required String url}) async {
    try {
      final response = await http.delete(Uri.parse(url));

      if (response.body.isEmpty) {
        throw Exception('❌ Failed ... . Response body is Empty');
      }

      if (response.statusCode >= 400) {
        throw HttpException('❌ Could not delete item. StatusCode: ' +
            response.statusCode.toString());
      }

      return response.body;
    } catch (error) {
      rethrow;
    }
  }
}
