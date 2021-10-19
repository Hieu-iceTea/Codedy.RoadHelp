import 'dart:convert';

import 'base_model.dart';

class Ward extends BaseModel {
  //
  int? provinceId;
  int? districtId;

  //
  String? name;
  String? prefix;

  Ward({
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
  factory Ward.fromJson(Map<String, dynamic> json) {
    return Ward(
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
  static List<Ward> fromJsonToList(dynamic json) {
    return json
        .map<Ward>((element) => Ward.fromJson(element))
        .toList();
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
