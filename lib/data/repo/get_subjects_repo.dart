import 'package:injectable/injectable.dart';
import 'package:online_exam/data/dataSources/remoteDataSource/get_subjects_datasource.dart';
import 'package:online_exam/domain/repo/get_subjects_repo.dart';

import '../../core/utils/result.dart';
import '../../domain/entity/get_subjects_entity.dart';

@Injectable(as: GetSubjectsRepo)
class GetSubjectsRepoImpl implements GetSubjectsRepo {
  GetSubjectsOnlineDataSource getSubjectsOnlineDataSource;
  GetSubjectsRepoImpl(this.getSubjectsOnlineDataSource);

  @override
  Future<Result<GetSubjects>> getSubjects() {
    // TODO: implement getSubjects
    return getSubjectsOnlineDataSource.getSubjects();
  }
}
