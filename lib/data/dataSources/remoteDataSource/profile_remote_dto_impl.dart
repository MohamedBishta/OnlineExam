// import 'package:injectable/injectable.dart';
// import 'package:online_exam/core/api/api_executer.dart';
// import 'package:online_exam/core/api/api_manager.dart';
// import 'package:online_exam/core/api/end_points.dart';
// import 'package:online_exam/core/utils/result.dart';
// import 'package:online_exam/core/utils/strings_manager.dart';
// import 'package:online_exam/data/dataSources/remoteDataSource/profile_remote_dto.dart';
//
// import '../../models/get_profile_dto.dart';
//
// @Injectable(as: ProfileRemoteDto)
// class ProfileRemoteDtoImpl extends ProfileRemoteDto {
//   final ApiManager apiManager;
//
//   ProfileRemoteDtoImpl(this.apiManager);
//   @override
//   Future<Result<GetProfileDto>> getProfile() async {
//     return apiExecutor<GetProfileDto>(() async {
//       var response =
//           await apiManager.getRequest(endPoint: EndPoints.getProfile, headers: {
//         'token': StringsManager.token,
//       });
//       //print(GetProfileDto.fromJson(response.data).user?.firstName);
//       return GetProfileDto.fromJson(response.data);
//     });
//   }
// }
