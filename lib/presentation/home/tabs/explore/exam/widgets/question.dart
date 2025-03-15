import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/data/models/get_all_question_on_exam_model.dart'
    show Questions;

import '../../../../../../data/models/check_answers_input_model.dart'
    show AnswersInputModel;
import '../cubit/exam_cubit.dart';
import 'custom_list_tile.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.question, required this.viewModel});
  final Questions question;
  final ExamCubit viewModel;
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String? _character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430.h,
      width: 343.w,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0.h, left: 8.w),
                child: Text(
                  widget.question.question ?? StringsManager.NoQuestion,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.question.answers?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 16.0.w),
                      child: CustomRadioListTile(
                        title: "${widget.question.answers?[index].answer}",
                        value: widget.question.answers?[index].key ?? 'no key',
                        groupValue: _character,
                        onChanged: (String? value) {
                          widget.viewModel.processIntent(AddAnswerIntent(
                              newAnswer: AnswersInputModel(
                                  questionId: widget.question.sId,
                                  correct: value)));
                          _character = value;

                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
