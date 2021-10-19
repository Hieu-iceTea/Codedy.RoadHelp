import 'dart:convert';

import 'base_model.dart';

class RatingIssues extends BaseModel {
  //
  String? userMemberId;
  String? issueId;

  //
  double? ratePoint;
  String? comment;

  RatingIssues({
    this.userMemberId,
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
  factory RatingIssues.fromJson(Map<String, dynamic> json) {
    return RatingIssues(
      userMemberId: json['userId'],
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
      'userId': userMemberId,
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
