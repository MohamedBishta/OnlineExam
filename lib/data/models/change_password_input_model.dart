class ChangePasswordInputModel {
  String? oldPassword;
  String? password;
  String? rePassword;

  ChangePasswordInputModel({this.oldPassword, this.password, this.rePassword});

  ChangePasswordInputModel.fromJson(Map<String, dynamic> json) {
    oldPassword = json['oldPassword'];
    password = json['password'];
    rePassword = json['rePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oldPassword'] = oldPassword;
    data['password'] = password;
    data['rePassword'] = rePassword;
    return data;
  }
}
