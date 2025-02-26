// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../core/api/api_manager.dart' as _i901;
import '../../../data/dataSources/remoteDataSource/forget_password_datasource.dart' as _i643;
import '../../../data/dataSources/remoteDataSource/forget_password_datasource_impl.dart' as _i233;
import '../../../data/dataSources/remoteDataSource/new_password_datasource.dart' as _i47;
import '../../../data/dataSources/remoteDataSource/new_password_datasource_impl.dart' as _i431;
import '../../../data/dataSources/remoteDataSource/otp_code_datasource.dart' as _i101;
import '../../../data/dataSources/remoteDataSource/otp_code_datasourceimpl.dart' as _i531;
import '../../../data/dataSources/remoteDataSource/profile_remote_dto.dart' as _i858;
import '../../../data/dataSources/remoteDataSource/profile_remote_dto_impl.dart' as _i56;
import '../../../data/repo/forget_password_repo.dart' as _i326;
import '../../../data/repo/new_password_repo.dart' as _i809;
import '../../../data/repo/otp_code_repo.dart' as _i1047;
import '../../../data/repo/profile_repo_impl.dart' as _i114;
import '../../../domain/repo/forget_password_repo.dart' as _i945;
import '../../../domain/repo/new_password_repo.dart' as _i962;
import '../../../domain/repo/otp_code_repo.dart' as _i941;
import '../../../domain/repo/profile_repo.dart' as _i725;
import '../../../domain/useCases/forget_password_usecase.dart' as _i248;
import '../../../domain/useCases/get_profile_usecase.dart' as _i28;
import '../../../domain/useCases/new_password_usecase.dart' as _i565;
import '../../../domain/useCases/otp_code_usecase.dart' as _i517;
import '../../../presentation/forget/cubit/foget_password_cubit.dart' as _i742;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i901.ApiManager>(() => _i901.ApiManager());
    gh.factory<_i858.ProfileRemoteDto>(() => _i56.ProfileRemoteDtoImpl(gh<_i901.ApiManager>()));
    gh.factory<_i101.OtpCodeDataOnlineSource>(() => _i531.OtpCodeDataOnlineSourceImpl(gh<_i901.ApiManager>()));
    gh.factory<_i643.ForgetPasswordOnlineDataSource>(
        () => _i233.ForgetPasswordOnlineDataSourceImpl(gh<_i901.ApiManager>()));
    gh.factory<_i47.NewPasswordDataOnlineSource>(() => _i431.NewPasswordDataOnlineSourceImpl(gh<_i901.ApiManager>()));
    gh.factory<_i941.OtpCodeRepo>(() => _i1047.OtpCodeRepoImpl(gh<_i101.OtpCodeDataOnlineSource>()));
    gh.factory<_i725.ProfileRepo>(() => _i114.ProfileRepoImpl(gh<_i858.ProfileRemoteDto>()));
    gh.factory<_i517.OtpCodeUseCase>(() => _i517.OtpCodeUseCase(gh<_i941.OtpCodeRepo>()));
    gh.factory<_i962.NewPasswordRepo>(() => _i809.NewPasswordRepoImpl(gh<_i47.NewPasswordDataOnlineSource>()));
    gh.factory<_i945.ForgetPasswordRepo>(
        () => _i326.ForgetPasswordRepoImpl(gh<_i643.ForgetPasswordOnlineDataSource>()));
    gh.factory<_i28.GetProfileUsecase>(() => _i28.GetProfileUsecase(gh<_i725.ProfileRepo>()));
    gh.factory<_i565.NewPasswordUseCase>(() => _i565.NewPasswordUseCase(gh<_i962.NewPasswordRepo>()));
    gh.factory<_i248.ForgetPasswordUseCase>(() => _i248.ForgetPasswordUseCase(gh<_i945.ForgetPasswordRepo>()));
    gh.factory<_i742.HomeViewModel>(() => _i742.HomeViewModel(
          gh<_i248.ForgetPasswordUseCase>(),
          gh<_i517.OtpCodeUseCase>(),
          gh<_i565.NewPasswordUseCase>(),
        ));
    return this;
  }
}
