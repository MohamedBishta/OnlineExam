import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/reusable_components/custom_circular_indicator.dart';
import 'package:online_exam/core/reusable_components/custom_err_icon.dart';
import 'package:online_exam/core/utils/assets_manager.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/data/models/check_answers_input_model.dart';
import 'package:online_exam/presentation/home/tabs/explore/exam/cubit/exam_cubit.dart';
import 'package:online_exam/presentation/home/tabs/explore/exam/widgets/question.dart';
import 'package:online_exam/presentation/home/tabs/explore/exam/widgets/timer.dart';

import '../../../../../core/di/di.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key, this.examId});
  final examId;

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  ExamCubit viewModel = getIt.get<ExamCubit>();
  final ValueNotifier<bool> _isLessThan5Minutes = ValueNotifier<bool>(false);
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    viewModel.processIntent(
        GetAllQuestionOnExamIntent(examId: widget.examId));
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    _isLessThan5Minutes.dispose();
    super.dispose();
  }
  void onTimeEnd() {
    // Show dialog when time ends
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 86,
                  width: 45,
                  child: Image.asset('assets/images/sandclock1.png', fit: BoxFit.contain),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Time out !!",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  viewModel.processIntent(
                    CheckAnswersIntent(
                        viewModel: viewModel,
                        context: context,
                        checkAnswersInputModel:
                        CheckAnswersInputModel(
                            answers:
                            viewModel.answersList,
                            time: 10)),
                  );
                  // Navigate back to the previous screen
                },
                child:  Text(StringsManager.YourScore, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsManager.ExamTitle,
          style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
        actions: [
          Image.asset(AssetsManager.timerIcon),
          BlocBuilder<ExamCubit, ExamState>(
              buildWhen: (previousState, currentState) {
                return previousState is ExamLoading;
              },
              bloc: viewModel,
              builder: (context, state) {
                if (state is ExamSuccess) {
                  return Timer(
                    isLessThan5Minutes: _isLessThan5Minutes,
                    examDuration: viewModel.questionsList![1].exam!.duration!,
                    onTimeEnd: onTimeEnd,

                  );
                } else if (state is ExamError) {
                  return CustomErrIcon();
                } else {
                  return SizedBox(
                      width: 85.w,
                      child: CustomLoadingIndicator()); // <-- Fixed
                }
              }),
        ],
      ),
      body: BlocBuilder<ExamCubit, ExamState>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is ExamSuccess) {
              return Padding(
                padding: EdgeInsets.only(top: 48.0.h),
                child: Column(
                  spacing: 8.h,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        '${StringsManager.Question} ${viewModel.currentQuestionNumber} of ${viewModel.totalQuestionNumber}',
                        style: Theme.of(context).textTheme.titleLarge),
                    LinearProgressIndicator(
                      value: viewModel.currentQuestionNumber /
                          viewModel.totalQuestionNumber,
                      color: ColorsManager.primaryColor,
                    ),
                    SizedBox(
                      height: 430.h,
                      width: 343.w,
                      child: ListView.builder(
                        // <-- Fixed
                        cacheExtent: 343.w * viewModel.totalQuestionNumber,
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Question(
                          viewModel: viewModel,
                          question: viewModel.questionsList![index],
                        ),
                        itemCount: viewModel.totalQuestionNumber,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0.w),
                      child: Row(
                        spacing: 16.w,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  side: BorderSide(
                                      color: ColorsManager.primaryColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fixedSize: Size(163.w, 48.h),
                                  foregroundColor: ColorsManager.primaryColor,
                                  backgroundColor: Colors.transparent),
                              onPressed: () {
                                viewModel.currentQuestionNumber == 1
                                    ? null
                                    : viewModel.processIntent(ScrollBackIntent(
                                        scrollController: scrollController));
                              },
                              child: Text(
                                StringsManager.Back,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: ColorsManager.primaryColor),
                              )),
                          TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fixedSize: Size(163.w, 48.h),
                                foregroundColor:
                                    ColorsManager.customBlue.shade50,
                                backgroundColor: ColorsManager.primaryColor),
                            onPressed: () {
                              viewModel.currentQuestionNumber ==
                                      viewModel.totalQuestionNumber
                                  ? viewModel.processIntent(
                                      CheckAnswersIntent(
                                          viewModel: viewModel,
                                          context: context,
                                          checkAnswersInputModel:
                                              CheckAnswersInputModel(
                                                  answers:
                                                      viewModel.answersList,
                                                  time: 10)),
                                    )
                                  : viewModel.processIntent(ScrollNextIntent(
                                      scrollController: scrollController));
                            },
                            child: Text(
                                viewModel.currentQuestionNumber ==
                                        viewModel.totalQuestionNumber
                                    ? StringsManager.Submit
                                    : StringsManager.Next,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color:
                                            ColorsManager.customBlue.shade50)),
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                  ],
                ),
              );
            } else if (state is ExamError) {
              return Center(child: Text(state.exception.toString()));
            } else {
              return Center(child: CustomLoadingIndicator());
            }
          }),
    );
  }
}
