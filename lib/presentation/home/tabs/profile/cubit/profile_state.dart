part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final EditeProfileResponseModel? editeProfileResponseModel;
  final  GetProfileEntity? profileData;
  ProfileSuccess({this.profileData, this.editeProfileResponseModel});
}

final class ProfileErr extends ProfileState {
  final String errMsg;

  ProfileErr({required this.errMsg});
}
