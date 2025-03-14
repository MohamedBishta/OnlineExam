import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/routing/routes_manager.dart';
import 'package:online_exam/data/models/check_answers_model.dart';
import 'package:online_exam/data/models/get_all_question_on_exam_model.dart';

import '../../../../../../core/utils/result.dart';
import '../../../../../../data/models/check_answers_input_model.dart';
import '../../../../../../domain/useCases/check_answers_usecase.dart';
import '../../../../../../domain/useCases/get_all_questions_on_exam_usecase.dart';

part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  ExamCubit(this._checkAnswersUsecase, this._getAllQuestionsOnExamUseCase)
      : super(ExamInitial());

  final CheckAnswersUsecase _checkAnswersUsecase;
  final GetAllQuestionsOnExamUseCase _getAllQuestionsOnExamUseCase;

  final double _scrollAmount = 343.0.w;
  bool _isScrolling = false;

  late CheckAnswersModel checkAnswersModel;
  List<Questions>? questionsList;
  List<AnswersInputModel> answersList = [];

  int bluePercentage = 0;
  int redPercentage = 0;

  int currentQuestionNumber = 1;
  int totalQuestionNumber = 20;

  processIntent(ExamIntent intent) {
    switch (intent) {
      case ScrollNextIntent():
        _scrollNext(intent.scrollController);
        break;
      case ScrollBackIntent():
        _scrollBack(intent.scrollController);
        break;
      case GetAllQuestionOnExamIntent():
        _getAllQuestionOnExam(intent.examId);
        break;
      case CheckAnswersIntent():
        _checkAnswers(
            intent.checkAnswersInputModel, intent.context, intent.viewModel);
        break;
      case AddAnswerIntent():
        _addAnswer(intent.newAnswer);
        break;
      case NavigateToExamScreenIntent():
        _navigateToExamScreen(intent.context);
    }
  }

  void _scrollNext(ScrollController scrollController) {
    if (_isScrolling) return;
    if (currentQuestionNumber < totalQuestionNumber) {
      currentQuestionNumber++;
      emit(ExamSuccess());
    }
    _isScrolling = true;
    if (scrollController.hasClients) {
      scrollController
          .animateTo(
        scrollController.offset + _scrollAmount,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      )
          .then((_) {
        _isScrolling = false;
      });
    }
  }

  void _scrollBack(ScrollController scrollController) {
    if (_isScrolling) return;
    if (currentQuestionNumber > 1) {
      currentQuestionNumber--;
      emit(ExamSuccess());
    }
    _isScrolling = true;
    if (scrollController.hasClients) {
      scrollController
          .animateTo(
        scrollController.offset - _scrollAmount,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      )
          .then((_) {
        _isScrolling = false;
      });
    }
  }

  void _getAllQuestionOnExam(String examId) async {
    emit(ExamLoading()); // Emit loading state
    final result = await _getAllQuestionsOnExamUseCase.call(examId: examId);
    switch (result) {
      case Success<GetAllQuestionOnExamModel>():
        questionsList = result.data!.questions;
        totalQuestionNumber = questionsList!.length;
        emit(ExamSuccess());
        break;
      case Err():
        emit(ExamError(exception: result.ex));
        break;
    }
  }

  void _addAnswer(AnswersInputModel newAnswer) {
    int index = answersList
        .indexWhere((answer) => answer.questionId == newAnswer.questionId);
    if (index != -1) {
      answersList[index] = newAnswer;
    } else {
      answersList.add(newAnswer);
    }
  }

  _checkAnswers(CheckAnswersInputModel checkAnswersInputModel,
      BuildContext context, ExamCubit viewModel) async {
    emit(ExamLoading());
    var result = await _checkAnswersUsecase.call(
        checkAnswersInput: checkAnswersInputModel);
    answersList.clear();
    switch (result) {
      case Success():
        _navigateToResultScreen(context, viewModel);
        checkAnswersModel = result.data;
        bluePercentage = ((checkAnswersModel.correctQuestions!.length /
                    totalQuestionNumber) *
                100)
            .toInt();
        redPercentage = 100 - bluePercentage;
        emit(ExamSuccess());
      case Err():
        emit(ExamError(exception: result.ex));
    }
  }

  _navigateToResultScreen(context, ExamCubit viewModel) {
    Navigator.pushReplacementNamed(context, RoutesManager.examScoreRouteName,
        arguments: viewModel);
  }

  _navigateToExamScreen(context) {
    Navigator.pushReplacementNamed(
      context,
      RoutesManager.examRouteName,
    );
  }
}

sealed class ExamIntent {}

final class NavigateToExamScreenIntent extends ExamIntent {
  final BuildContext context;
  NavigateToExamScreenIntent({required this.context});
}

final class ScrollNextIntent extends ExamIntent {
  final ScrollController scrollController;
  ScrollNextIntent({required this.scrollController});
}

final class ScrollBackIntent extends ExamIntent {
  final ScrollController scrollController;
  ScrollBackIntent({required this.scrollController});
}

final class CheckAnswersIntent extends ExamIntent {
  final CheckAnswersInputModel checkAnswersInputModel;
  final BuildContext context;
  final ExamCubit viewModel;
  CheckAnswersIntent({
    required this.context,
    required this.checkAnswersInputModel,
    required this.viewModel,
  });
}

final class GetAllQuestionOnExamIntent extends ExamIntent {
  final String examId;
  GetAllQuestionOnExamIntent({required this.examId});
}

final class AddAnswerIntent extends ExamIntent {
  final AnswersInputModel newAnswer;
  AddAnswerIntent({required this.newAnswer});
}
