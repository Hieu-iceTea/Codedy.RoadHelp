import 'dart:convert';

import '/models/user.dart';
import 'base_model.dart';
import 'garage.dart';

class RatingGarage extends BaseModel {
  //
  int? garageId;
  int? userMemberId;

  //
  int? ratePoint;
  String? comment;

  //Relationship
  Garage? garage;
  User? userMember;

  RatingGarage({
    this.garageId,
    this.userMemberId,
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
      garageId: json['garageId'],
      userMemberId: json['userMemberId'],
      //
      ratePoint: json['ratePoint'],
      comment: json['comment'],
      //Relationship
      garage: json['garage'] != null ? Garage.fromJson(json['garage']) : null,
      userMember:
          json['userMember'] != null ? User.fromJson(json['userMember']) : null,
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
      'garageId': garageId,
      'userMemberId': userMemberId,
      //
      'ratePoint': ratePoint,
      'comment': comment,
      //Relationship
      'userMember': json.decode(userMember!.toJson()),
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
