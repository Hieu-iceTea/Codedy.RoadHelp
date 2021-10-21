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

  Province({
    this.name,
    this.code,
    //Relationship
    this.garages,
    this.districts,
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
  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      name: json['name'],
      code: json['code'],
      //Relationship
      /*garages: Garage.fromJsonToList(json['garages']),
      districts: District.fromJsonToList(json['districts']),
      wards: Ward.fromJsonToList(json['wards']),*/
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
