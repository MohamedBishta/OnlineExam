/// username : "userName"
/// firstName : "firstName"
/// lastName : "lastName"
/// email : "email"
/// password : "password"
/// rePassword : "confirmPassword"
/// phone : "phone"

class SignUpModel {
  SignUpModel({
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.password, 
      this.rePassword, 
      this.phone,});

  SignUpModel.fromJson(dynamic json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phone = json['phone'];
  }
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }

}