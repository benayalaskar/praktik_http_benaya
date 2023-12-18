import 'dart:convert';

import 'user.dart';

class LoginResponse {
  String? jwt;
  User? user;

  LoginResponse({this.jwt, this.user});

  factory LoginResponse.fromMap(Map<String, dynamic> data) => LoginResponse(
        jwt: data['jwt'] as String?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'jwt': jwt,
        'user': user?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginResponse].
  factory LoginResponse.fromJson(String data) {
    return LoginResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
