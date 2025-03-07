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
import '../../../data/dataSources/datasource_contract/auth_datasource/auth_datasource.dart'
    as _i523;
import '../../../data/dataSources/datasource_impl/auth_datasource_impl/auth_datasource_impl.dart'
    as _i245;
import '../../../data/dataSources/remoteDataSource/profile_remote_dto.dart'
    as _i858;
import '../../../data/repo/profile_repo_impl.dart' as _i114;
import '../../../data/repo/repository_impl/auth_repo_impl/auth_repo_impl.dart'
    as _i129;
import '../../../domain/repo/auth_repo/auth_repo.dart' as _i399;
import '../../../domain/repo/profile_repo.dart' as _i725;
import '../../../domain/useCases/get_profile_usecase.dart' as _i28;
import '../../../domain/useCases/signin_usecase.dart' as _i172;
import '../../../domain/useCases/signup_usecase.dart' as _i172;
import '../../../presentation/auth/view_model/auth_view_model.dart' as _i464;

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
    gh.factory<_i725.ProfileRepo>(
        () => _i114.ProfileRepoImpl(gh<_i858.ProfileRemoteDto>()));
    gh.factory<_i523.AuthDataSource>(
        () => _i245.AuthDataSourceImpl(gh<_i901.ApiManager>()));
    gh.factory<_i399.AuthRepo>(
        () => _i129.AuthRepoImpl(gh<_i523.AuthDataSource>()));
    gh.factory<_i28.GetProfileUsecase>(
        () => _i28.GetProfileUsecase(gh<_i725.ProfileRepo>()));
    gh.factory<_i172.SignInUseCase>(
        () => _i172.SignInUseCase(gh<_i399.AuthRepo>()));
    gh.factory<_i172.SignUpUseCase>(
        () => _i172.SignUpUseCase(gh<_i399.AuthRepo>()));
    gh.factory<_i464.AuthViewModel>(() => _i464.AuthViewModel(
          gh<_i172.SignUpUseCase>(),
          gh<_i172.SignInUseCase>(),
        ));
    return this;
  }
}
