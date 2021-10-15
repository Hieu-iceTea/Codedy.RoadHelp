import 'dart:convert';

import 'base_model.dart';

class User extends BaseModel {
  String? userName;
  String? email;
  String? password;
  String? imageUrl;
  bool? gender;
  String? firstName;
  String? lastName;
  String? phone;
  bool? active;

  User({
    this.userName,
    this.email,
    this.password,
    this.imageUrl,
    this.gender,
    this.firstName,
    this.lastName,
    this.phone,
    this.active,
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
      userName: json['userName'],
      email: json['email'],
      password: json['password'],
      imageUrl: json['imageUrl'],
      gender: json['gender'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      active: json['active'],
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
      'userName': userName,
      'email': email,
      'password': password,
      'imageUrl': imageUrl,
      'gender': gender,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'active': active,
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
