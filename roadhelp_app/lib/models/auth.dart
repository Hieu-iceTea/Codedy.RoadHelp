import 'dart:convert';

class Auth {
  /// NOTE: Phần này chỉ phục vụ xác thực, không phải là entity model có thật trong database

  //request
  String? username;
  String? password;

  //response
  int? userId;
  DateTime? exp;
  int? expiresIn;
  List<String>? roles;
  String? accessToken;
  String? tokenType;

  Auth({
    //request
    this.username,
    this.password,

    //response
    this.userId,
    this.exp,
    this.expiresIn,
    this.roles,
    this.accessToken,
    this.tokenType,
  });

  //
  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      //request
      username: json['username'],
      password: json['password'],
      //response
      userId: json['id'],
      //exp: json['exp'],
      expiresIn: json['expiresIn'],
      roles: json['roles'].map<String>((e) => e.toString()).toList(),
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
    );
  }

  //
  String toJson() {
    return json.encode({
      //request
      'username': username,
      'password': password,
      //response
      'id': userId,
      'exp': exp,
      'expiresIn': expiresIn,
      'roles': roles,
      'accessToken': accessToken,
      'tokenType': tokenType,
    });
  }
}
