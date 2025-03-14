import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_executer.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/data/models/check_answers_input_model.dart';
import 'package:online_exam/data/models/check_answers_model.dart';
import 'package:online_exam/data/models/get_all_question_on_exam_model.dart';

import '../../../core/api/api_manager.dart';
import '../../../core/api/end_points.dart';
import 'exam_repo_datasource.dart';

@Injectable(as: ExamRepoDS)
class ExamRepoDsImpl implements ExamRepoDS {
  final ApiManager apiManager;

  ExamRepoDsImpl(this.apiManager);
  @override
  Future<Result<GetAllQuestionOnExamModel>> getAllQuestionOnExam(
      {required String examId}) async {
    return apiExecutor(
      () async {
        var response = await apiManager.get(
          endPoint: EndPoints.getAllQuestionOnExam,
          param: {'exam': examId},
        );

        if (response.statusCode == 200) {
          print(
              "zzzzzzzzzzzzzzzzzz${GetAllQuestionOnExamModel.fromJson(response.data).questions![2].question}");
          return GetAllQuestionOnExamModel.fromJson(response.data);
        } else {
          throw Exception(response.data['message']);
        }
      },
    );
  }

  @override
  Future<Result<CheckAnswersModel>> checkAnswers(
      {required CheckAnswersInputModel checkAnswersInput}) async {
    return apiExecutor(
      () async {
        var response = await apiManager.post(
          endPoint: EndPoints.checkAnswers,
          body: checkAnswersInput.toJson(),
        );
        if (response.statusCode == 200) {
          print(
              "llllllllllllllllllll ${CheckAnswersModel.fromJson(response.data).wrongQuestions!.length.toString()}");
          return CheckAnswersModel.fromJson(response.data);
        } else {
          throw Exception(response.data['message']);
        }
      },
    );
  }
}
