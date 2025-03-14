import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import '../../../core/api/api_executer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/utils/result.dart';
import '../../../domain/entity/get_subject_exams_entity.dart';
import 'get_subject_exam_datasource.dart';

@Injectable(as: GetSubjectExamOnlineDataSource)
class GetSubjectExamOnlineDataSourceImpl
    implements GetSubjectExamOnlineDataSource {
  ApiManager apiManager;
  GetSubjectExamOnlineDataSourceImpl(this.apiManager);
  @override
  Future<Result<GetSubjectExams>> getSubjectExam(String subjectId) {
    return apiExecutor(
      () async {
        var response =
            await apiManager.get(endPoint: EndPoints.getSubjectExams, param: {
          'subject': subjectId,
        });
        if (response.statusCode == 200) {
          return GetSubjectExams.fromJson(response.data);
        } else {
          throw Exception(GetSubjectExams.fromJson(response.data).message);
        }
      },
    );
  }
}
