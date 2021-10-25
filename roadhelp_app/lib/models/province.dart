import 'dart:convert';

import '/models/ward.dart';
import 'base_model.dart';
import 'district.dart';
import 'garage.dart';

class Province extends BaseModel {
  String? name;
  String? code;

  //Relationship
  List<Garage>? garages;
  List<District>? districts;
  List<Ward>? wards;
  List<int>? districtIds;
  List<int>? wardIds;

  Province({
    this.name,
    this.code,
    //Relationship
    this.garages,
    this.districts,
    this.wards,
    this.districtIds,
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
  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      name: json['name'],
      code: json['code'],
      //Relationship
      garages:
          json['garages'] != null ? Garage.fromJsonToList(json['garages']) : [],
      districts: json['districts'] != null
          ? District.fromJsonToList(json['districts'])
          : [],
      wards: json['wards'] != null ? Ward.fromJsonToList(json['wards']) : [],
      districtIds: json['districtIds'] != null
          ? json['districtIds'].map<int>((element) => element).toList()
          : [],
      wardIds: json['wardIds'] != null
          ? json['wardIds'].map<int>((element) => element).toList()
          : [],
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
  static List<Province> fromJsonToList(dynamic json) {
    return json.map<Province>((element) => Province.fromJson(element)).toList();
  }

  //
  String toJson() {
    return json.encode({
      'name': name,
      'code': code,
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
