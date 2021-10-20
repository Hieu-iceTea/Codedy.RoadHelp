import 'dart:convert';

import '/models/user.dart';
import 'base_model.dart';

class Authority extends BaseModel {
  //
  String? username;

  //
  String? authority;

  //Relationship
  User? user;

  Authority({
    this.username,
    this.authority,
    //Relationship
    this.user,
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
  factory Authority.fromJson(Map<String, dynamic> json) {
    return Authority(
      username: json['username'],
      authority: json['authority'],
      //Relationship
      user: User.fromJson(json['user']),
      //json.decode(json['user'])
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
  static List<Authority> fromJsonToList(dynamic json) {
    return json
        .map<Authority>((element) => Authority.fromJson(element))
        .toList();
  }

  //
  String toJson() {
    return json.encode({
      'username': username,
      'authority': authority,
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
