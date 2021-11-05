import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:roadhelp/models/garage_image.dart';

import '/config/constants.dart';
import '/helper/http_helper.dart';

class GarageImageRepository {
  static const String _url = baseApiUrl + "api/v1/garageImages/";

  static Future<List<GarageImage>> findAll() async {
    var responseBody = await HttpHelper.get(
      url: _url,
    );

    /*List<GarageImage> items = [
      for (var element in responseBody) GarageImage.fromJson(element)
    ];*/

    return responseBody
        .map<GarageImage>((element) => GarageImage.fromJson(element))
        .toList();
  }

  static Future<GarageImage> findById(int id) async {
    var responseBody = await HttpHelper.get(
      url: _url + id.toString(),
    );

    return GarageImage.fromJson(responseBody);
  }

  static Future<GarageImage> create(GarageImage item) async {
    var responseBody = await HttpHelper.post(
      url: _url,
      body: item.toJson(),
    );

    return GarageImage.fromJson(responseBody);
  }

  static Future<GarageImage> update(GarageImage item) async {
    var responseBody = await HttpHelper.put(
      url: _url + item.id.toString(),
      body: item.toJson(),
    );

    return GarageImage.fromJson(responseBody);
  }

  static Future<dynamic> deleteById(int id) async {
    return await HttpHelper.delete(
      url: _url + id.toString(),
    );
  }

  //#region - Extend -
  static Future<GarageImage> addImageByGarageId(
      {required int garageId, required File imageFile}) async {
    var responseBody = await HttpHelper.multipartRequest(
      method: "POST",
      url: _url + "addImageByGarageId/" + garageId.toString(),
      fields: {},
      files: [
        await http.MultipartFile.fromPath("imageFile", imageFile.path),
      ],
    );

    return GarageImage.fromJson(responseBody);
  }
//#endregion
}
