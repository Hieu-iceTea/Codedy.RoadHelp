import 'dart:convert';

import '/config/enums.dart';
import 'base_model.dart';

class Issue extends BaseModel {
  //
  int? userId;
  int? partnerId;

  //
  String? address;
  String? phone;
  double? longitude;
  double? latitude;
  IssueCategory? category;
  String? description;
  IssueStatus? status;

  Issue({
    this.userId,
    this.partnerId,
    this.address,
    this.phone,
    this.longitude,
    this.latitude,
    this.category,
    this.description,
    this.status,
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
      userId: json['userId'],
      partnerId: json['partnerId'],
      address: json['address'],
      phone: json['phone'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      category: json['category'],
      description: json['description'],
      status: json['status'],
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
      'userId': userId,
      'partnerId': partnerId,
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
