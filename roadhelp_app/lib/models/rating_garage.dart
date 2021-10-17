import 'dart:convert';

import 'base_model.dart';

class RatingGarage extends BaseModel {
  //
  int? garageID;
  int? userID;

  //
  double? ratePoint;
  String? comment;

  RatingGarage({
    this.garageID,
    this.userID,
    this.ratePoint,
    this.comment,
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
  factory RatingGarage.fromJson(Map<String, dynamic> json) {
    return RatingGarage(
      garageID: json['garageID'],
      userID: json['userID'],
      ratePoint: json['ratePoint'],
      comment: json['comment'],
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
      'garageID': garageID,
      'userID': userID,
      'ratePoint': ratePoint,
      'comment': comment,
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
