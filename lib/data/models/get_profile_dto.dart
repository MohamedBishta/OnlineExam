import 'package:online_exam/domain/entity/get_profile_entity.dart';

class GetProfileDto extends GetProfileEntity {
  GetProfileDto({
    super.message,
    super.user,
  });

  GetProfileDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
  }
}

class UserDto extends UserEntity {
  UserDto({
    this.id,
    super.username,
    super.firstName,
    super.lastName,
    super.email,
    super.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  UserDto.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
  }
  String? id;

  String? role;
  bool? isVerified;
  String? createdAt;
}
