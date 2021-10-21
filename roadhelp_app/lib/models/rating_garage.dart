import 'dart:convert';

import '/models/user.dart';
import 'base_model.dart';
import 'garage.dart';

class RatingGarage extends BaseModel {
  //
  int? garageID;
  int? userID;

  //
  double? ratePoint;
  String? comment;

  //Relationship
  Garage? garage;
  User? userMember;

  RatingGarage({
    this.garageID,
    this.userID,
    this.ratePoint,
    this.comment,
    //Relationship
    this.garage,
    this.userMember,
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
  factory RatingGarage.fromJson(Map<String, dynamic> json) {
    return RatingGarage(
      garageID: json['garageID'],
      userID: json['userID'],
      ratePoint: json['ratePoint'],
      comment: json['comment'],
      //Relationship
      garage: Garage.fromJson(json['garage']),
      userMember: User.fromJson(json['userMember']),
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
  static List<RatingGarage> fromJsonToList(dynamic json) {
    return json
        .map<RatingGarage>((element) => RatingGarage.fromJson(element))
        .toList();
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
