import 'package:online_exam/domain/entity/user_entity.dart';

/// username : "elevate112233"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admin13344@1elevate.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// _id : "67b0eace86a024f06ea26f01"
/// createdAt : "2025-02-15T19:28:14.915Z"

class UserModel {
  UserModel({
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.role, 
      this.isVerified, 
      this.id, 
      this.createdAt,});

  UserModel.fromJson(dynamic json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? id;
  String? createdAt;
UserModel copyWith({  String? username,
  String? firstName,
  String? lastName,
  String? email,
  String? phone,
  String? role,
  bool? isVerified,
  String? id,
  String? createdAt,
}) => UserModel(  username: username ?? this.username,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  role: role ?? this.role,
  isVerified: isVerified ?? this.isVerified,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }
  UserEntity toUserEntity(){
    return UserEntity(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      id: id,
      phone: phone
    );
}
}