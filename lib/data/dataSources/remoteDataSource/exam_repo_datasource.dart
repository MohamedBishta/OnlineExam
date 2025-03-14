import 'package:online_exam/data/models/get_all_question_on_exam_model.dart';

import '../../../core/utils/result.dart';
import '../../models/check_answers_input_model.dart';
import '../../models/check_answers_model.dart';

abstract class ExamRepoDS {
  Future<Result<GetAllQuestionOnExamModel>> getAllQuestionOnExam(
      {required String examId});
  Future<Result<CheckAnswersModel>> checkAnswers(
      {required CheckAnswersInputModel checkAnswersInput});
}
