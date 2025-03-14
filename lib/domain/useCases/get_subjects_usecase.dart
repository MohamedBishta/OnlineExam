import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/domain/entity/get_subjects_entity.dart';
import 'package:online_exam/domain/repo/get_subjects_repo.dart';

@injectable
class GetSubjectsUseCase {
  GetSubjectsRepo getSubjectsRepo;
  GetSubjectsUseCase(this.getSubjectsRepo);

  Future<Result<GetSubjects>> getSubjects() async {
    var subjects = await getSubjectsRepo.getSubjects();
    return subjects;
  }
}
