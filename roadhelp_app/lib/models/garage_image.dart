import 'dart:convert';

import '/config/constants.dart';
import 'base_model.dart';
import 'garage.dart';

class GarageImage extends BaseModel {
  //
  int? garageId;

  //
  String? image;

  //Relationship
  Garage? garage;

  //Xử lý sau khi get API (chuyển từ image -> imageUrl):
  String? get imageUrl {
    if (image != null) {
      return baseApiUrl + "data-images/garage/" + image!;
    }
  }

  //TODO: nhớ bỏ dòng này khi app có dữ liệu thật, k còn dữ liệu fake
  set imageUrl(String? imageUrl) {
    this.imageUrl = imageUrl;
  }

  GarageImage({
    this.garageId,
    this.image,
    //Relationship
    this.garage,
    //
    int? id,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
    int? version,
    bool? deleted,
  }) : super(
          id: id,
          createdAt: createdAt,
          createdBy: createdBy,
          updatedAt: updatedAt,
          updatedBy: updatedBy,
          version: version,
          deleted: deleted,
        );

  //
  factory GarageImage.fromJson(Map<String, dynamic> json) {
    return GarageImage(
      garageId: json['garageId'],
      //
      image: json['image'],
      //Relationship
      garage: json['garage'] != null ? Garage.fromJson(json['garage']) : null,
      //
      id: json['id'],
      //createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      //updatedAt: json['updatedAt'],
      updatedBy: json['updatedBy'],
      version: json['version'],
      deleted: json['deleted'],
    );
  }

  //
  static List<GarageImage> fromJsonToList(dynamic json) {
    return json
        .map<GarageImage>((element) => GarageImage.fromJson(element))
        .toList();
  }

  //
  String toJson() {
    return json.encode({
      'garageId': garageId,
      //
      'image': image,
      //Relationship
      'garage': json.decode(garage!.toJson()),
      //
      'id': id,
      //'createdAt': createdAt,
      'createdBy': createdBy,
      //'updatedAt': updatedAt,
      'updatedBy': updatedBy,
      'version': version,
      'deleted': deleted,
    });
  }
}
