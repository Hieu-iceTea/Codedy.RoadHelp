import 'dart:convert';

import 'package:roadhelp/config/enums.dart';

import 'base_model.dart';

class User extends BaseModel {
  //
  String? username;

  //
  String? email;
  String? phone;
  String? password;

  //
  String? firstName;
  String? lastName;
  String? imageUrl;
  UserGender? gender;
  bool? active;

  //
  String? address;
  double? rateAvg;

  User({
    this.username,
    this.email,
    this.phone,
    this.password,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.gender,
    this.active,
    this.address,
    this.rateAvg,
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
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      imageUrl: json['image'],
      gender: json['gender'],
      active: json['active'],
      address: json['address'],
      rateAvg: json['rateAvg'],
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
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'image': imageUrl,
      'gender': gender,
      'active': active,
      'address': address,
      'rateAvg': rateAvg,
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
