import '../../core/utils/result.dart';
import '../entity/get_subjects_entity.dart';

abstract class GetSubjectsRepo{
  Future<Result<GetSubjects>> getSubjects();
}