import 'dart:convert';

import 'base_model.dart';

class RatingPartner extends BaseModel {
  //
  String? partnerId;
  String? userId;
  String? issueId;

  //
  double? ratePoint;
  String? comment;

  RatingPartner({
    this.partnerId,
    this.userId,
    this.issueId,
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
  factory RatingPartner.fromJson(Map<String, dynamic> json) {
    return RatingPartner(
      partnerId: json['partnerId'],
      userId: json['userId'],
      issueId: json['issueId'],
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
      'partnerId': partnerId,
      'userId': userId,
      'issueId': issueId,
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
