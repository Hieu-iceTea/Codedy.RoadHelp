import 'dart:convert';

import 'package:roadhelp/config/constants.dart';

import '/config/enums.dart';
import '/models/garage.dart';
import '/models/issue.dart';
import '/models/rating_garage.dart';
import '/models/rating_issue.dart';
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

  //Xử lý sau khi get API (chuyển từ image -> imageUrl):
  String? get imageUrl {
    if (image != null) {
      return baseApiUrl + "data-images/user/" + image!;
    }

    return baseApiUrl + "data-images/user/" + "_default_user.png";
  }

  bool hasAuthority(String authority) {
    if (authorities == null || authorities!.isEmpty) {
      return false;
    }

    for (var element in authorities!) {
      if (element.authority == authority) {
        return true;
      }
    }

    return false;
  }

  //Relationship
  List<Authority>? authorities;
  List<Issue>? memberIssues;
  List<Issue>? partnerIssues;
  List<RatingIssue>? ratingIssues;
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
    this.memberIssues,
    this.partnerIssues,
    this.ratingIssues,
    this.ratingGarages,
    this.garages,
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
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      image: json['image'],
      gender: json['gender'] != null
          ? UserGender.values
              .firstWhere((e) => e.toString() == "UserGender." + json['gender'])
          : null,
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      address: json['address'],
      active: json['active'],
      rateAvg: json['rateAvg'],
      //Relationship
      authorities: json['authorities'] != null
          ? Authority.fromJsonToList(json['authorities'])
          : [],
      garages:
          json['garages'] != null ? Garage.fromJsonToList(json['garages']) : [],
      memberIssues: json['memberIssues'] != null
          ? Issue.fromJsonToList(json['memberIssues'])
          : [],
      partnerIssues: json['partnerIssues'] != null
          ? Issue.fromJsonToList(json['partnerIssues'])
          : [],
      ratingGarages: json['ratingGarages'] != null
          ? RatingGarage.fromJsonToList(json['ratingGarages'])
          : [],
      ratingIssues: json['ratingIssues'] != null
          ? RatingIssue.fromJsonToList(json['ratingIssues'])
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
      'gender': gender != null ? gender!.index : null,
      'active': active,
      'address': address,
      'rateAvg': rateAvg,
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
