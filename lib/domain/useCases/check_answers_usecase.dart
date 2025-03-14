import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/repo/exam_repo.dart';

import '../../data/models/check_answers_input_model.dart';

@injectable
class CheckAnswersUsecase {
  final ExamRepo examRepo;
  CheckAnswersUsecase(this.examRepo);
  call({required CheckAnswersInputModel checkAnswersInput}) =>
      examRepo.checkAnswers(checkAnswersInput: checkAnswersInput);
}
