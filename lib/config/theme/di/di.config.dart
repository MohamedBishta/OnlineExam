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
import '../../../data/dataSources/remoteDataSource/profile_remote_dto.dart'
    as _i858;
import '../../../data/dataSources/remoteDataSource/profile_remote_dto_impl.dart'
    as _i56;
import '../../../data/repo/profile_repo_impl.dart' as _i114;
import '../../../domain/repo/profile_repo.dart' as _i725;
import '../../../domain/useCases/edite_profile_usecase.dart' as _i236;
import '../../../domain/useCases/get_profile_usecase.dart' as _i28;
import '../../../presentation/home/tabs/profile/cubit/profile_cubit.dart'
    as _i769;

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
    gh.factory<_i858.ProfileRemoteDto>(
        () => _i56.ProfileRemoteDtoImpl(gh<_i901.ApiManager>()));
    gh.factory<_i725.ProfileRepo>(
        () => _i114.ProfileRepoImpl(gh<_i858.ProfileRemoteDto>()));
    gh.factory<_i236.EditeProfileUsecase>(
        () => _i236.EditeProfileUsecase(gh<_i725.ProfileRepo>()));
    gh.factory<_i28.GetProfileUsecase>(
        () => _i28.GetProfileUsecase(gh<_i725.ProfileRepo>()));
    gh.factory<_i769.ProfileCubit>(() => _i769.ProfileCubit(
          gh<_i28.GetProfileUsecase>(),
          gh<_i236.EditeProfileUsecase>(),
        ));
    return this;
  }
}
