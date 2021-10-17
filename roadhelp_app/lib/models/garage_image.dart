import 'dart:convert';

import 'base_model.dart';

class GarageImage extends BaseModel {
  //
  String? garageId;

  //
  String? image;

  //Xử lý sau khi get API (chuyển từ image -> imageUrl):
  String? imageUrl;

  GarageImage({
    this.garageId,
    this.image,
    this.imageUrl,
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
