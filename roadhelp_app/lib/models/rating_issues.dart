import 'dart:convert';

import '/models/user.dart';
import 'base_model.dart';
import 'issues.dart';

class RatingIssues extends BaseModel {
  //
  int? userMemberId;
  int? issueId;

  //
  int? ratePoint;
  String? comment;

  //Relationship
  Issues? issue;
  User? userMember;

  RatingIssues({
    this.userMemberId,
    this.issueId,
    this.ratePoint,
    this.comment,
    //Relationship
    this.issue,
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
  factory RatingIssues.fromJson(Map<String, dynamic> json) {
    return RatingIssues(
      issueId: json['issueId'],
      userMemberId: json['userMemberId'],
      //
      ratePoint: json['ratePoint'],
      comment: json['comment'],
      //Relationship
      issue: json['issue'] != null ? Issues.fromJson(json['issue']) : null,
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
  static List<RatingIssues> fromJsonToList(dynamic json) {
    return json
        .map<RatingIssues>((element) => RatingIssues.fromJson(element))
        .toList();
  }

  //
  String toJson() {
    return json.encode({
      'userMemberId': userMemberId,
      'issueId': issueId,
      //
      'ratePoint': ratePoint,
      'comment': comment,
      //Relationship
      'userMember': json.decode(userMember!.toJson()),
      'issue': json.decode(issue!.toJson()),
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
