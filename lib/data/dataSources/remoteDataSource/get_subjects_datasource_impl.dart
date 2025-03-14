import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_executer.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/end_points.dart';
import '../../../core/utils/result.dart';
import '../../../domain/entity/get_subjects_entity.dart';
import 'get_subjects_datasource.dart';

@Injectable(as: GetSubjectsOnlineDataSource)
class GetSubjectsOnlineDataSourceImpl implements GetSubjectsOnlineDataSource {
  final ApiManager apiManager;

  GetSubjectsOnlineDataSourceImpl(this.apiManager);
  @override
  Future<Result<GetSubjects>> getSubjects() {
    // TODO: implement getSubjects
    return apiExecutor(
      () async {
        var response = await apiManager.get(endPoint: EndPoints.getSubjects);
        if (response.statusCode == 200) {
          return GetSubjects.fromJson(response.data);
        } else {
          throw Exception(GetSubjects.fromJson(response.data).message);
        }
      },
    );
  }
}
