class GetProfileEntity {
  GetProfileEntity({
    this.message,
    this.user,
  });

  String? message;
  UserEntity? user;
}

class UserEntity {
  UserEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
}
