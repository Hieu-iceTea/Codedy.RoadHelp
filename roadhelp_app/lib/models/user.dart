import 'dart:convert';

import '/config/enums.dart';
import '/models/garage.dart';
import '/models/issues.dart';
import '/models/rating_garage.dart';
import '/models/rating_issues.dart';
import 'authority.dart';
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
  String? image;
  UserGender? gender;
  bool? active;

  //
  String? address;
  double? rateAvg;

  //
  String? imageUrl;

  //Relationship
  List<Authority>? authorities;
  List<Issues>? issueMembers;
  List<Issues>? issuePartners;
  List<RatingIssues>? ratingIssues;
  List<RatingGarage>? ratingGarages;
  List<Garage>? garages;

  User({
    this.username,
    this.email,
    this.phone,
    this.password,
    this.firstName,
    this.lastName,
    this.image,
    this.gender,
    this.active,
    this.address,
    this.rateAvg,
    //Relationship
    this.authorities,
    this.issueMembers,
    this.issuePartners,
    this.ratingIssues,
    this.ratingGarages,
    this.garages,
    //
    this.imageUrl,
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
      image: json['image'],
      gender: UserGender.values[json['gender']],
      active: json['active'],
      address: json['address'],
      rateAvg: json['rateAvg'],
      //Relationship
      authorities: Authority.fromJsonToList(json['authorities']),
      issueMembers: Issues.fromJsonToList(json['issueMembers']),
      issuePartners: Issues.fromJsonToList(json['issuePartners']),
      ratingIssues: RatingIssues.fromJsonToList(json['ratingIssues']),
      ratingGarages: RatingGarage.fromJsonToList(json['ratingGarages']),
      garages: Garage.fromJsonToList(json['garages']),
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
  static List<User> fromJsonToList(dynamic json) {
    return json.map<User>((element) => User.fromJson(element)).toList();
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
      'image': image,
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
