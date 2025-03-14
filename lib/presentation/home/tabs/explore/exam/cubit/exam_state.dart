part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}

final class ExamInitial extends ExamState {}

final class ExamSuccess extends ExamState {
  final List<Questions>? allQuestion;

  ExamSuccess({this.allQuestion});
}

final class ExamError extends ExamState {
  final Exception exception;

  ExamError({required this.exception});
}

final class ExamLoading extends ExamState {}

//final class ExamScroll extends ExamState {}
