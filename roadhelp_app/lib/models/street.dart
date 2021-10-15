import 'dart:convert';

import 'base_model.dart';

class Street extends BaseModel {
  //
  int? provinceId;
  int? districtId;

  //
  String? name;
  String? prefix;

  Street({
    this.provinceId,
    this.districtId,
    this.name,
    this.prefix,
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
  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      provinceId: json['provinceId'],
      districtId: json['districtId'],
      name: json['name'],
      prefix: json['prefix'],
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
      'provinceId': provinceId,
      'districtId': districtId,
      'name': name,
      'prefix': prefix,
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
