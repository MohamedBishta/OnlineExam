import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:online_exam/config/theme/di/di.dart';
import 'package:online_exam/config/theme/my_theme.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/presentation/home/tabs/explore/cubit/get_subjects_cubit.dart';
import 'package:online_exam/presentation/home/tabs/explore/cubit/get_subjects_state.dart';
import 'package:online_exam/presentation/home/tabs/explore/start_exam.dart';

import '../../../../core/reusable_components/custom_circular_indicator.dart';
import '../../../../core/utils/strings_manager.dart';

class SubjectExam extends StatefulWidget {
  const SubjectExam({super.key, this.subjectId, this.subjectName});
  final subjectId;
  final subjectName;

  @override
  State<SubjectExam> createState() => _SubjectExamState();
}

class _SubjectExamState extends State<SubjectExam> {
  SubjectsViewModel viewModel = getIt.get<SubjectsViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.onIntent(GetSubjectsExamIntent(widget.subjectId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<SubjectsViewModel, GetSubjectsState>(
        listener: (context, state) {
          if (state is GetSubjectsExam) {
          } else if (state is GetSubjectsFailure) {
          } else if (state is GetSubjectsLoading) {
            showDialog(
              barrierDismissible: false,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return SpinKitThreeBounce(
                  color: Theme.of(context).primaryColor,
                  size: 50.0,
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is GetSubjectsLoading) {
            return Scaffold(
              body: CustomLoadingIndicator(),
            );
          } else if (state is GetSubjectsExam) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                ),
                body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      spacing: 20.0,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back_ios, size: 20.sp),
                            ),
                            Text(
                              widget.subjectName,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(StringsManager.Quiz,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 22))
                          ],
                        ),
                        Expanded(
                          child: state.exams.length == 0
                              ? Center(
                                  child: Text(
                                    'No Exam found',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: ColorsManager.customBlue,
                                            fontSize: 30),
                                  ),
                                )
                              : ListView.builder(
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => StartExam(
                                                subjectName: widget.subjectName,
                                                duration:
                                                    state.exams[index].duration,
                                                questions: state.exams[index].numberOfQuestions,
                                              ),
                                            ));
                                      },
                                      child: Card(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.all(10.0),
                                          leading: Image(
                                              image: AssetImage(
                                                  'assets/images/Profit.png')),
                                          title: Row(
                                            children: <Widget>[
                                              Text(state.exams[index].title ??
                                                  'No Title'),
                                              Spacer(),
                                              Text(
                                                '${state.exams[index].duration} ${StringsManager.Minutes}' ??
                                                    'No Duration',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                        color: ColorsManager
                                                            .customBlue),
                                              ),
                                            ],
                                          ),
                                          subtitle: Text(
                                              '${state.exams[index].numberOfQuestions} ${StringsManager.Question}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: state.exams.length,
                                ),
                        ),
                      ],
                    )),
              ),
            );
          } else if (state is GetSubjectsFailure) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
