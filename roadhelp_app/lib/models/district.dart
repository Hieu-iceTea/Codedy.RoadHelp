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
  List<int>? wardIds;

  District({
    this.provinceId,
    this.name,
    this.prefix,
    //Relationship
    this.garages,
    this.province,
    this.wards,
    this.wardIds,
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
      //
      name: json['name'],
      prefix: json['prefix'],
      //Relationship
      garages:
          json['garages'] != null ? Garage.fromJsonToList(json['garages']) : [],
      province:
          json['province'] != null ? Province.fromJson(json['province']) : null,
      wards: json['wards'] != null ? Ward.fromJsonToList(json['wards']) : [],
      wardIds: json['wardIds'] != null
          ? json['wardIds'].map<int>((element) => element).toList()
          : [],
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
  static List<District> fromJsonToList(dynamic json) {
    return json.map<District>((element) => District.fromJson(element)).toList();
  }

  //
  String toJson() {
    return json.encode({
      'provinceId': provinceId,
      //
      'name': name,
      'prefix': prefix,
      //Relationship
      'province': province != null ? json.decode(province!.toJson()) : null,
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
