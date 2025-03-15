import '../../../core/utils/result.dart';
import '../../../domain/entity/get_subject_exams_entity.dart';

abstract class GetSubjectExamOnlineDataSource {
  Future<Result<GetSubjectExams>> getSubjectExam(String subjectId);
}
