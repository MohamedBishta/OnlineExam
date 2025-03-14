import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/repo/exam_repo.dart';

@injectable
class GetAllQuestionsOnExamUseCase {
  final ExamRepo examRepo;
  GetAllQuestionsOnExamUseCase(this.examRepo);
  call({required String examId}) =>
      examRepo.getAllQuestionOnExam(examId: examId);
}
