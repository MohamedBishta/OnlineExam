class EditeProfileResponseModel {
  String? message;
  EditeUserResponseModel? user;

  EditeProfileResponseModel({this.message, this.user});

  EditeProfileResponseModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? EditeUserResponseModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class EditeUserResponseModel {
  String? sId;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  String? password;
  bool? isVerified;
  String? createdAt;

  EditeUserResponseModel(
      {this.sId,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.role,
      this.password,
      this.isVerified,
      this.createdAt});

  EditeUserResponseModel.fromJson(dynamic json) {
    sId = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    password = json['password'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    data['password'] = password;
    data['isVerified'] = isVerified;
    data['createdAt'] = createdAt;
    return data;
  }
}
