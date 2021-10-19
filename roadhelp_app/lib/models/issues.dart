import 'dart:convert';

import 'package:roadhelp/models/rating_issues.dart';
import 'package:roadhelp/models/user.dart';

import '/config/enums.dart';
import 'base_model.dart';

class Issues extends BaseModel {
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
  RatingIssues? ratingIssue;

  Issues({
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
  factory Issues.fromJson(Map<String, dynamic> json) {
    return Issues(
      userMemberId: json['userMemberId'],
      userPartnerId: json['userPartnerId'],
      address: json['address'],
      phone: json['phone'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      category: json['category'],
      description: json['description'],
      status: json['status'],
      //Relationship
      userMember: User.fromJson(json['userMember']),
      userPartner: User.fromJson(json['userPartner']),
      ratingIssue: RatingIssues.fromJson(json['ratingIssue']),
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
  static List<Issues> fromJsonToList(dynamic json) {
    return json.map<Issues>((element) => Issues.fromJson(element)).toList();
  }

  //
  String toJson() {
    return json.encode({
      'userMemberId': userMemberId,
      'userPartnerId': userPartnerId,
      'address': address,
      'phone': phone,
      'longitude': longitude,
      'latitude': latitude,
      'category': category,
      'description': description,
      'status': status,
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
