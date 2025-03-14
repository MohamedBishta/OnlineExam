import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/entity/get_subjects_entity.dart';
import 'package:online_exam/domain/useCases/get_subject_exams_usecase.dart';
import 'package:online_exam/domain/useCases/get_subjects_usecase.dart';
import 'package:online_exam/presentation/home/tabs/explore/cubit/get_subjects_state.dart';

import '../../../../../core/utils/result.dart';

@injectable
class SubjectsViewModel extends Cubit<GetSubjectsState> {
  GetSubjectsUseCase getSubjectsUseCase;
  GetSubjectExamUseCase getSubjectExamUseCase;
  SubjectsViewModel(this.getSubjectsUseCase, this.getSubjectExamUseCase)
      : super(GetSubjectsInitial());

  void onIntent(SubjectsIntent intent) {
    switch (intent) {
      case GetSubjectsIntent():
        _handelSubjectsData();
        break;
      case GetSubjectsExamIntent():
        _handelSubjectsExamData(intent.SubjectId);
        break;
    }
  }

  Future<void> _handelSubjectsData() async {
    emit(GetSubjectsLoading());
    final response = await getSubjectsUseCase.getSubjects();
    switch (response) {
      case Success():
        var data = response.data?.subjects;
        emit(GetSubjectsSuccess(data));
        break;
      case Err():
        emit(GetSubjectsFailure(response.ex.toString()));
    }
  }

  Future<void> _handelSubjectsExamData(String subjectId) async {
    emit(GetSubjectsLoading());
    final response = await getSubjectExamUseCase.getSubjectExam(subjectId);
    switch (response) {
      case Success():
        var data = response.data?.exams;
        emit(GetSubjectsExam(data));
        break;
      case Err():
        emit(GetSubjectsFailure(response.ex.toString()));
    }
  }
}

sealed class SubjectsIntent {}

class GetSubjectsIntent extends SubjectsIntent {}

class GetSubjectsExamIntent extends SubjectsIntent {
  String SubjectId;
  GetSubjectsExamIntent(this.SubjectId);
}
