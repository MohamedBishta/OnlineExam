import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/core/utils/shared_prefrence_manager.dart';
import 'package:online_exam/data/dataSources/remoteDataSource/exam_repo_datasource.dart';
import 'package:online_exam/data/models/check_answers_input_model.dart';
import 'package:online_exam/data/models/check_answers_model.dart';
import 'package:online_exam/data/models/get_all_question_on_exam_model.dart';

import '../../domain/repo/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRepoDS examRepoDS;

  ExamRepoImpl({
    required this.examRepoDS,
  });
  @override
  Future<Result<GetAllQuestionOnExamModel>> getAllQuestionOnExam(
      {required String examId}) async {
    var result = await examRepoDS.getAllQuestionOnExam(examId: examId);
    switch (result) {
      case Success():
        result.data!.questions?[0].exam?.sId != null
            ? SharedPreferencesManager.saveDataModel(
                key: result.data!.questions![0].exam!.sId!,
                data: result.data!.toJson())
            : null;
        return Success(result.data);
      case Err():
        return Err<GetAllQuestionOnExamModel>(ex: result.ex);
    }
  }

  @override
  Future<Result<CheckAnswersModel>> checkAnswers(
      {required CheckAnswersInputModel checkAnswersInput}) async {
    var result =
        await examRepoDS.checkAnswers(checkAnswersInput: checkAnswersInput);
    switch (result) {
      case Success():
        return Success(result.data);
      case Err():
        return Err<CheckAnswersModel>(ex: result.ex);
    }
  }
}
