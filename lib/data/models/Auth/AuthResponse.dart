import 'package:online_exam/domain/entity/auth_entity.dart';

import 'UserModel.dart';

/// message : "success"
/// code : 409
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjBlYWNlODZhMDI0ZjA2ZWEyNmYwMSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5NjQ3Njk1fQ.gdw8v9m2ON09eK6G0RxzoziGUwWWBWZMlDQcUzIBIjI"
/// user : {"username":"elevate112233","firstName":"Elevate","lastName":"Tech","email":"admin13344@1elevate.com","phone":"01094155711","role":"user","isVerified":false,"_id":"67b0eace86a024f06ea26f01","createdAt":"2025-02-15T19:28:14.915Z"}

class AuthResponse {
  AuthResponse({
      this.message, 
      this.code, 
      this.token, 
      this.user,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
  String? message;
  int? code;
  String? token;
  UserModel? user;
AuthResponse copyWith({  String? message,
  int? code,
  String? token,
  UserModel? user,
}) => AuthResponse(  message: message ?? this.message,
  code: code ?? this.code,
  token: token ?? this.token,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
  AuthEntity toAuthEntity(){
    return AuthEntity(
      user: user?.toUserEntity(),
      message: message,
      token: token,
    );
  }
}