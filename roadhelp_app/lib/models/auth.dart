import 'dart:convert';

class Auth {
  /// NOTE: Phần này chỉ phục vụ xác thực, không phải là entity model có thật trong database

  //
  String? username;
  String? password;

  Auth({
    this.username,
    this.password,
  });

  //
  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      username: json['username'],
      password: json['password'],
    );
  }

  //
  String toJson() {
    return json.encode({
      'username': username,
      'password': password,
    });
  }
}
