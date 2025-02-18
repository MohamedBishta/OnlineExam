import 'package:online_exam/data/models/get_profile_dto.dart';

class EditeProfileInputModel extends UserDto {
  EditeProfileInputModel(
      {super.username,
      super.firstName,
      super.lastName,
      super.email,
      super.phone});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
