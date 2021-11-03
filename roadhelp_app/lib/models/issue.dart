import 'dart:convert';

import '/config/enums.dart';
import '/models/rating_issue.dart';
import '/models/user.dart';
import 'base_model.dart';

class Issue extends BaseModel {
  //
  int? userMemberId;
  int? userPartnerId;

  //
  String? address;
  String? phone;
  double? longitude;
  double? latitude;
  IssueCategory? category;
  String? description;
  IssueStatus? status;

  //Relationship
  User? userMember;
  User? userPartner;
  RatingIssue? ratingIssue;

  Issue({
    this.userMemberId,
    this.userPartnerId,
    this.address,
    this.phone,
    this.longitude,
    this.latitude,
    this.category,
    this.description,
    this.status,
    //Relationship
    this.userMember,
    this.userPartner,
    this.ratingIssue,
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
  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      userMemberId: json['userMemberId'],
      userPartnerId: json['userPartnerId'],
      //
      longitude: json['longitude'],
      latitude: json['latitude'],
      phone: json['phone'],
      address: json['address'],
      category: IssueCategory.values.firstWhere(
          (e) => e.toString() == "IssueCategory." + json['category']),
      description: json['description'],
      status: IssueStatus.values
          .firstWhere((e) => e.toString() == "IssueStatus." + json['status']),
      //Relationship
      userMember:
          json['userMember'] != null ? User.fromJson(json['userMember']) : null,
      userPartner: json['userPartner'] != null
          ? User.fromJson(json['userPartner'])
          : null,
      ratingIssue: json['ratingIssue'] != null
          ? RatingIssue.fromJson(json['ratingIssue'])
          : null,
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
  static List<Issue> fromJsonToList(dynamic json) {
    return json.map<Issue>((element) => Issue.fromJson(element)).toList();
  }

  //
  String toJson() {
    return json.encode({
      'userMemberId': userMemberId,
      'userPartnerId': userPartnerId,
      //
      'address': address,
      'phone': phone,
      'longitude': longitude,
      'latitude': latitude,
      'category': category != null ? category!.index : null,
      'description': description,
      'status': status != null ? status!.index : null,
      //Relationship
      'userMember':
          userMember != null ? json.decode(userMember!.toJson()) : null,
      'userPartner':
          userPartner != null ? json.decode(userPartner!.toJson()) : null,
      'ratingIssue':
          ratingIssue != null ? json.decode(ratingIssue!.toJson()) : null,
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
