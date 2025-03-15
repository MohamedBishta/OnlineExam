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

import '../../data/dataSources/remoteDataSource/exam_repo_datasource.dart'
    as _i1031;
import '../../data/dataSources/remoteDataSource/exam_repo_datasource_impl.dart'
    as _i598;
import '../../data/dataSources/remoteDataSource/forget_password_datasource.dart'
    as _i940;
import '../../data/dataSources/remoteDataSource/forget_password_datasource_impl.dart'
    as _i960;
import '../../data/dataSources/remoteDataSource/get_subject_exam_datasource.dart'
    as _i898;
import '../../data/dataSources/remoteDataSource/get_subject_exam_datasource_impl.dart'
    as _i286;
import '../../data/dataSources/remoteDataSource/get_subjects_datasource.dart'
    as _i224;
import '../../data/dataSources/remoteDataSource/get_subjects_datasource_impl.dart'
    as _i554;
import '../../data/dataSources/remoteDataSource/new_password_datasource.dart'
    as _i854;
import '../../data/dataSources/remoteDataSource/new_password_datasource_impl.dart'
    as _i103;
import '../../data/dataSources/remoteDataSource/otp_code_datasource.dart'
    as _i225;
import '../../data/dataSources/remoteDataSource/otp_code_datasourceimpl.dart'
    as _i529;
import '../../data/dataSources/remoteDataSource/profile_remote_dto.dart'
    as _i13;
import '../../data/dataSources/remoteDataSource/profile_remote_dto_impl.dart'
    as _i134;
import '../../data/repo/exam_repo_impl.dart' as _i675;
import '../../data/repo/forget_password_repo.dart' as _i602;
import '../../data/repo/get_subject_exam_repo.dart' as _i558;
import '../../data/repo/get_subjects_repo.dart' as _i857;
import '../../data/repo/new_password_repo.dart' as _i573;
import '../../data/repo/otp_code_repo.dart' as _i715;
import '../../data/repo/profile_repo_impl.dart' as _i767;
import '../../domain/repo/exam_repo.dart' as _i935;
import '../../domain/repo/forget_password_repo.dart' as _i765;
import '../../domain/repo/get_subject_exam_repo.dart' as _i70;
import '../../domain/repo/get_subjects_repo.dart' as _i902;
import '../../domain/repo/new_password_repo.dart' as _i755;
import '../../domain/repo/otp_code_repo.dart' as _i571;
import '../../domain/repo/profile_repo.dart' as _i851;
import '../../domain/useCases/change_password_usecase.dart' as _i165;
import '../../domain/useCases/check_answers_usecase.dart' as _i948;
import '../../domain/useCases/edite_profile_usecase.dart' as _i134;
import '../../domain/useCases/forget_password_usecase.dart' as _i747;
import '../../domain/useCases/get_all_questions_on_exam_usecase.dart' as _i75;
import '../../domain/useCases/get_profile_usecase.dart' as _i431;
import '../../domain/useCases/get_subject_exams_usecase.dart' as _i604;
import '../../domain/useCases/get_subjects_usecase.dart' as _i802;
import '../../domain/useCases/new_password_usecase.dart' as _i566;
import '../../domain/useCases/otp_code_usecase.dart' as _i733;
import '../../presentation/forget/cubit/foget_password_cubit.dart' as _i670;
import '../../presentation/home/tabs/explore/cubit/get_subjects_cubit.dart'
    as _i584;
import '../../presentation/home/tabs/explore/exam/cubit/exam_cubit.dart'
    as _i628;
import '../../presentation/home/tabs/profile/cubit/profile_cubit.dart' as _i933;
import '../api/api_manager.dart' as _i1047;

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
    gh.factory<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i224.GetSubjectsOnlineDataSource>(
        () => _i554.GetSubjectsOnlineDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i13.ProfileRemoteDto>(
        () => _i134.ProfileRemoteDtoImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i225.OtpCodeDataOnlineSource>(
        () => _i529.OtpCodeDataOnlineSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i940.ForgetPasswordOnlineDataSource>(() =>
        _i960.ForgetPasswordOnlineDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i1031.ExamRepoDS>(
        () => _i598.ExamRepoDsImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i898.GetSubjectExamOnlineDataSource>(() =>
        _i286.GetSubjectExamOnlineDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i854.NewPasswordDataOnlineSource>(
        () => _i103.NewPasswordDataOnlineSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i571.OtpCodeRepo>(
        () => _i715.OtpCodeRepoImpl(gh<_i225.OtpCodeDataOnlineSource>()));
    gh.factory<_i902.GetSubjectsRepo>(() =>
        _i857.GetSubjectsRepoImpl(gh<_i224.GetSubjectsOnlineDataSource>()));
    gh.factory<_i802.GetSubjectsUseCase>(
        () => _i802.GetSubjectsUseCase(gh<_i902.GetSubjectsRepo>()));
    gh.factory<_i851.ProfileRepo>(
        () => _i767.ProfileRepoImpl(gh<_i13.ProfileRemoteDto>()));
    gh.factory<_i733.OtpCodeUseCase>(
        () => _i733.OtpCodeUseCase(gh<_i571.OtpCodeRepo>()));
    gh.factory<_i755.NewPasswordRepo>(() =>
        _i573.NewPasswordRepoImpl(gh<_i854.NewPasswordDataOnlineSource>()));
    gh.factory<_i70.GetSubjectExamRepo>(() => _i558.GetSubjectExamRepoImpl(
        gh<_i898.GetSubjectExamOnlineDataSource>()));
    gh.factory<_i765.ForgetPasswordRepo>(() => _i602.ForgetPasswordRepoImpl(
        gh<_i940.ForgetPasswordOnlineDataSource>()));
    gh.factory<_i935.ExamRepo>(
        () => _i675.ExamRepoImpl(examRepoDS: gh<_i1031.ExamRepoDS>()));
    gh.factory<_i165.ChangePasswordUsecase>(
        () => _i165.ChangePasswordUsecase(gh<_i851.ProfileRepo>()));
    gh.factory<_i134.EditeProfileUsecase>(
        () => _i134.EditeProfileUsecase(gh<_i851.ProfileRepo>()));
    gh.factory<_i431.GetProfileUsecase>(
        () => _i431.GetProfileUsecase(gh<_i851.ProfileRepo>()));
    gh.factory<_i604.GetSubjectExamUseCase>(
        () => _i604.GetSubjectExamUseCase(gh<_i70.GetSubjectExamRepo>()));
    gh.factory<_i948.CheckAnswersUsecase>(
        () => _i948.CheckAnswersUsecase(gh<_i935.ExamRepo>()));
    gh.factory<_i75.GetAllQuestionsOnExamUseCase>(
        () => _i75.GetAllQuestionsOnExamUseCase(gh<_i935.ExamRepo>()));
    gh.factory<_i584.SubjectsViewModel>(() => _i584.SubjectsViewModel(
          gh<_i802.GetSubjectsUseCase>(),
          gh<_i604.GetSubjectExamUseCase>(),
        ));
    gh.factory<_i628.ExamCubit>(() => _i628.ExamCubit(
          gh<_i948.CheckAnswersUsecase>(),
          gh<_i75.GetAllQuestionsOnExamUseCase>(),
        ));
    gh.factory<_i933.ProfileCubit>(() => _i933.ProfileCubit(
          gh<_i431.GetProfileUsecase>(),
          gh<_i134.EditeProfileUsecase>(),
          gh<_i165.ChangePasswordUsecase>(),
        ));
    gh.factory<_i566.NewPasswordUseCase>(
        () => _i566.NewPasswordUseCase(gh<_i755.NewPasswordRepo>()));
    gh.factory<_i747.ForgetPasswordUseCase>(
        () => _i747.ForgetPasswordUseCase(gh<_i765.ForgetPasswordRepo>()));
    gh.factory<_i670.HomeViewModel>(() => _i670.HomeViewModel(
          gh<_i747.ForgetPasswordUseCase>(),
          gh<_i733.OtpCodeUseCase>(),
          gh<_i566.NewPasswordUseCase>(),
        ));
    return this;
  }
}
