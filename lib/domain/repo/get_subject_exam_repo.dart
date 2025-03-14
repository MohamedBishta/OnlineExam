import '../../core/utils/result.dart';
import '../entity/get_subject_exams_entity.dart';

abstract class GetSubjectExamRepo {
  Future<Result<GetSubjectExams>> getSubjectExam(String subjectId);
}
