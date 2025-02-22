import 'user_entity.dart';

/// message : "success"
/// code : 409
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjBlYWNlODZhMDI0ZjA2ZWEyNmYwMSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5NjQ3Njk1fQ.gdw8v9m2ON09eK6G0RxzoziGUwWWBWZMlDQcUzIBIjI"
/// user : {"username":"elevate112233","firstName":"Elevate","lastName":"Tech","email":"admin13344@1elevate.com","phone":"01094155711","role":"user","isVerified":false,"_id":"67b0eace86a024f06ea26f01","createdAt":"2025-02-15T19:28:14.915Z"}

class AuthEntity {
  AuthEntity({
      this.message, 
      this.token,
      this.user,});

  String? message;
  String? token;
  UserEntity? user;

}