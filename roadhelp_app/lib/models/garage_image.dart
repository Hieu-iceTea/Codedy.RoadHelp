import 'dart:convert';

import '/config/constants.dart';
import 'base_model.dart';
import 'garage.dart';

class GarageImage extends BaseModel {
  //
  String? garageId;

  //
  String? image;

  //Relationship
  Garage? garage;

  //Xử lý sau khi get API (chuyển từ image -> imageUrl):
  String? imageUrl;

  GarageImage({
    this.garageId,
    this.image,
    this.imageUrl,
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
      image: json['image'],
      //Relationship
      garage: json['garage'] is int ? null : Garage.fromJson(json['garage']),
      //
      imageUrl: baseApiUrl + "data-images/garage/" + json['image'],
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
      'image': image,
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
