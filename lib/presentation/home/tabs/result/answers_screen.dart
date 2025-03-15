import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/shared_prefrence_manager.dart';
import 'package:online_exam/data/models/get_all_question_on_exam_model.dart';

import '../../../../data/models/check_answers_input_model.dart';

class AnswersScreen extends StatelessWidget {
  AnswersScreen({super.key});

  final GetAllQuestionOnExamModel questionsList =
      GetAllQuestionOnExamModel.fromJson(SharedPreferencesManager.getDataModel(
          key: '670070a830a3c3c1944a9c63')!);

  final CheckAnswersInputModel checkAnswersInputModel =
      CheckAnswersInputModel.fromJson(SharedPreferencesManager.getDataModel(
          key: 'answers_670070a830a3c3c1944a9c63')!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        title: Text(
          'Answers',
          style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Answer(
            question: questionsList.questions![index],
            chosenAnswer: checkAnswersInputModel.answers![index].questionId ==
                    questionsList.questions![index].sId
                ? checkAnswersInputModel.answers![index].correct
                : null,
          );
        },
        itemCount: questionsList.questions?.length ?? 0,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  const Answer({super.key, required this.question, this.chosenAnswer});
  final Questions question;
  final String? chosenAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.customGray.shade50,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question ?? 'no question',
            style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: 16.h),
          ListView.builder(
            shrinkWrap: true, // Allow ListView to shrink-wrap its content
            physics: const NeverScrollableScrollPhysics(),
            itemCount: question.answers?.length,
            itemBuilder: (context, index) {
              return CustomRadioListTile(
                title: question.answers?[index].answer ?? 'no answer',
                isCorrect: 'A${index + 1}' == question.correct,
                isChosen: chosenAnswer != null && 'A$index' == chosenAnswer,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomRadioListTile extends StatelessWidget {
  final String title;
  final bool isCorrect;
  final bool isChosen;

  const CustomRadioListTile({
    super.key,
    required this.title,
    this.isCorrect = false,
    this.isChosen = false,
  });

  @override
  Widget build(BuildContext context) {
    Color tileColor = ColorsManager.customBlue.shade50;
    Color radioColor = ColorsManager.primaryColor;
    Color activeColor = ColorsManager.primaryColor;

    if (isCorrect) {
      tileColor = ColorsManager.lightGreen;
      radioColor = ColorsManager.green;
      activeColor = ColorsManager.green;
    } else if (isChosen) {
      tileColor = ColorsManager.lightRed;
      radioColor = ColorsManager.red;
      activeColor = ColorsManager.red;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isCorrect
              ? ColorsManager.green
              : isChosen
                  ? ColorsManager.red
                  : ColorsManager.customBlue.shade50,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
        ),
        leading: Radio<String>(
          value: title,
          groupValue: isChosen ? title : null,
          onChanged: null,
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              return radioColor;
            },
          ),
          activeColor: activeColor,
        ),
        tileColor: tileColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
