import 'package:injectable/injectable.dart';
import '../../core/utils/result.dart';
import '../../domain/entity/get_subject_exams_entity.dart';
import '../../domain/repo/get_subject_exam_repo.dart';
import '../dataSources/remoteDataSource/get_subject_exam_datasource.dart';

@Injectable(as: GetSubjectExamRepo)
class GetSubjectExamRepoImpl implements GetSubjectExamRepo {
  GetSubjectExamOnlineDataSource getSubjectExamOnlineDataSource;
  GetSubjectExamRepoImpl(this.getSubjectExamOnlineDataSource);
  @override
  Future<Result<GetSubjectExams>> getSubjectExam(String subjectId) {
    // TODO: implement getSubjectExam
    return getSubjectExamOnlineDataSource.getSubjectExam(subjectId);
  }
}
