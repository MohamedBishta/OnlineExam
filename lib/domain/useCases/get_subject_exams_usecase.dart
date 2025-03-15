import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/domain/entity/get_subject_exams_entity.dart';

import '../repo/get_subject_exam_repo.dart';

@injectable
class GetSubjectExamUseCase {
  GetSubjectExamRepo getSubjectExamRepo;
  GetSubjectExamUseCase(this.getSubjectExamRepo);

  Future<Result<GetSubjectExams>> getSubjectExam(String subjectId) {
    return getSubjectExamRepo.getSubjectExam(subjectId);
  }
}
