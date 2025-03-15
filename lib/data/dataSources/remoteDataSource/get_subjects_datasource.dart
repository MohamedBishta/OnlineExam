import 'package:online_exam/core/utils/result.dart';

import '../../../domain/entity/get_subjects_entity.dart';

abstract class GetSubjectsOnlineDataSource {
  Future<Result<GetSubjects>> getSubjects();
}
