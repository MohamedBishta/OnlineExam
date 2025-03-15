/// username : "elevate112233"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admin13344@1elevate.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// _id : "67b0eace86a024f06ea26f01"
/// createdAt : "2025-02-15T19:28:14.915Z"

class UserEntity {
  UserEntity({
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone,
      this.id,
  });

  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? id;

}