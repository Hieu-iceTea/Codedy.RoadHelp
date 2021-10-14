import 'dart:convert';

import 'base_model.dart';

class Admin extends BaseModel {
  String? userName;
  String? email;
  String? password;
  String? imageUrl;
  bool? gender;
  String? firstName;
  String? lastName;
  String? phone;
  bool? active;
  String? address; //Cột này không có trong: Partner, User

  Admin({
    this.userName,
    this.email,
    this.password,
    this.imageUrl,
    this.gender,
    this.firstName,
    this.lastName,
    this.phone,
    this.active,
    this.address,
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
  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      userName: json['username'],
      email: json['email'],
      password: json['password'],
      imageUrl: json['image'],
      gender: json['gender'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      active: json['active'],
      address: json['address'],
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
      'username': userName,
      'email': email,
      'password': password,
      'image': imageUrl,
      'gender': gender,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'active': active,
      'address': address,
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
