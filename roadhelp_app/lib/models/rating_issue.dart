import 'dart:convert';

import '/models/user.dart';
import 'base_model.dart';
import 'issue.dart';

class RatingIssue extends BaseModel {
  //
  int? userMemberId;
  int? issueId;

  //
  int? ratePoint;
  String? comment;

  //Relationship
  Issue? issue;
  User? userMember;

  RatingIssue({
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
  factory RatingIssue.fromJson(Map<String, dynamic> json) {
    return RatingIssue(
      issueId: json['issueId'],
      userMemberId: json['userMemberId'],
      //
      ratePoint: json['ratePoint'],
      comment: json['comment'],
      //Relationship
      issue: json['issue'] != null ? Issue.fromJson(json['issue']) : null,
      userMember:
          json['userMember'] != null ? User.fromJson(json['userMember']) : null,
      //
      id: json['id'],
      createdAt: json['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'], isUtc: true) : null,
      createdBy: json['createdBy'],
      updatedAt: json['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(json['updatedAt'], isUtc: true) : null,
      updatedBy: json['updatedBy'],
      version: json['version'],
      deleted: json['deleted'],
    );
  }

  //
  static List<RatingIssue> fromJsonToList(dynamic json) {
    return json
        .map<RatingIssue>((element) => RatingIssue.fromJson(element))
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
      'userMember':
          userMember != null ? json.decode(userMember!.toJson()) : null,
      'issue': issue != null ? json.decode(issue!.toJson()) : null,
      //
      'id': id,
      //'createdAt': createdAt,
      'createdBy': createdBy,
      //'updatedAt': updatedAt, //DateTime.now().millisecondsSinceEpoch | updatedAt.millisecondsSinceEpoch
      'updatedBy': updatedBy,
      'version': version,
      'deleted': deleted,
    });
  }
}
