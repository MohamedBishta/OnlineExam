import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/data/models/check_answers_model.dart';

import '../../data/models/check_answers_input_model.dart';
import '../../data/models/get_all_question_on_exam_model.dart';

abstract class ExamRepo {
  Future<Result<GetAllQuestionOnExamModel>> getAllQuestionOnExam(
      {required String examId});
  Future<Result<CheckAnswersModel>> checkAnswers(
      {required CheckAnswersInputModel checkAnswersInput});
}
