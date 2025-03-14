import '../../../../../domain/entity/get_subjects_entity.dart';

sealed class GetSubjectsState {}

class GetSubjectsInitial extends GetSubjectsState {}

class GetSubjectsLoading extends GetSubjectsState {}

class GetSubjectsSuccess extends GetSubjectsState {
  final  subjects;
  GetSubjectsSuccess(this.subjects);
}
class GetSubjectsExam extends GetSubjectsState {
  final  exams;
  GetSubjectsExam(this.exams);
}
class GetSubjectsFailure extends GetSubjectsState {
  final String error;
  GetSubjectsFailure(this.error);
}
