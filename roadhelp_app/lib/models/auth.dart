import 'dart:convert';

import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/repositories/user_repository.dart';

class Auth {
  /// NOTE: Phần này chỉ phục vụ xác thực, không phải là entity model có thật trong database

  //request login
  String? username;
  String? password;
  bool rememberMe;

  //request sign up
  String? email;
  String? phone;

  //response
  int? userId;
  DateTime? exp;
  int? expiresIn;
  List<String>? roles;
  String? accessToken;
  String? tokenType;
  String? message;

  //extend
  User? currentUser;

  DateTime? expiryDate;

  /*DateTime? get expiryDate {
    if (expiresIn != null) {
      return DateTime.now().add(
        Duration(
          seconds: expiresIn!,
        ),
      );
    }
  }*/

  bool get isAuth {
    return validAccessToken != null;
  }

  String? get validAccessToken {
    if (expiryDate != null &&
        expiryDate!.isAfter(DateTime.now()) &&
        accessToken != null) {
      return accessToken;
    }
    return null;
  }

  Auth({
    //request login
    this.username,
    this.password,
    this.rememberMe = false,

    //request sign up
    this.email,
    this.phone,

    //response
    this.userId,
    this.exp,
    this.expiresIn,
    this.roles,
    this.accessToken,
    this.tokenType,
    this.message,

    //extend
    this.expiryDate,
  });

  //
  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      //request login
      username: json['username'],
      password: json['password'],
      rememberMe: json['rememberMe'] ?? false,
      //request sign up
      email: json['email'],
      phone: json['phone'],
      //response
      userId: json['id'],
      //exp: json['exp'],
      expiresIn: json['expiresIn'],
      roles: json['roles']?.map<String>((e) => e.toString()).toList(),
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
      message: json['message'],
      //extend
      expiryDate: json['expiryDate'] != null
          ? DateTime.parse(json['expiryDate'])
          : json['expiresIn'] != null
              ? DateTime.now().add(
                  Duration(
                    seconds: json['expiresIn'],
                  ),
                )
              : null,
    );
  }

  //
  String toJson() {
    return json.encode({
      //request login
      'username': username,
      'password': password,
      'rememberMe': rememberMe,
      //request sign up
      'email': email,
      'phone': phone,
      //response
      'id': userId,
      'exp': exp,
      'expiresIn': expiresIn,
      'roles': roles,
      'accessToken': accessToken,
      'tokenType': tokenType,
      'message': message,
      //
      'expiryDate': expiryDate?.toIso8601String(),
    });
  }
}
