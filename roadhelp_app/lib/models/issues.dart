import 'dart:convert';

import '/config/enums.dart';
import '/models/rating_issues.dart';
import '/models/user.dart';
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
          ? RatingIssues.fromJson(json['ratingIssue'])
          : null,
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
      //
      'address': address,
      'phone': phone,
      'longitude': longitude,
      'latitude': latitude,
      'category': category, //TODO: kiểm tra lại, chuyển từ ENUM -> String
      'description': description,
      'status': status, //TODO: kiểm tra lại, chuyển từ ENUM -> String
      //Relationship
      'userMember': json.decode(userMember!.toJson()),
      'userPartner': json.decode(userPartner!.toJson()),
      'ratingIssue': json.decode(ratingIssue!.toJson()),
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
