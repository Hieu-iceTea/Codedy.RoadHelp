import 'dart:convert';

import '/models/province.dart';
import '/models/ward.dart';
import 'base_model.dart';
import 'garage.dart';

class District extends BaseModel {
  //
  int? provinceId;

  //
  String? name;
  String? prefix;

  //Relationship
  List<Garage>? garages;
  Province? province;
  List<Ward>? wards;

  District({
    this.provinceId,
    this.name,
    this.prefix,
    //Relationship
    this.garages,
    this.province,
    this.wards,
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
  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      provinceId: json['provinceId'],
      name: json['name'],
      prefix: json['prefix'],
      //Relationship
      garages: Garage.fromJsonToList(json['garages']),
      province: Province.fromJson(json['province']),
      wards: Ward.fromJsonToList(json['wards']),
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
  static List<District> fromJsonToList(dynamic json) {
    return json.map<District>((element) => District.fromJson(element)).toList();
  }

  //
  String toJson() {
    return json.encode({
      'provinceId': provinceId,
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
