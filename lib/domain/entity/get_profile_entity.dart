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
   factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  // Convert UserEntity to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    };
  }
  
}
