import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'cubit/exam_cubit.dart';

class ExamScoreScreen extends StatelessWidget {
  const ExamScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ExamCubit viewModel =
        ModalRoute.of(context)!.settings.arguments as ExamCubit;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 48.0.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      //Navigator.pop(context);
                    },
                  ),
                  Text(
                    StringsManager.YourScore,
                    style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.headlineMedium),
                  ),
                ],
              ),
              CircleChart(
                viewModel: viewModel,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringsManager.Correct,
                        style: GoogleFonts.inter(
                                textStyle:
                                    Theme.of(context).textTheme.headlineSmall)
                            .copyWith(color: ColorsManager.primaryColor),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: Text(
                          StringsManager.Incorrect,
                          style: GoogleFonts.inter(
                                  textStyle:
                                      Theme.of(context).textTheme.headlineSmall)
                              .copyWith(color: ColorsManager.red),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 30, // Circle size
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ColorsManager.primaryColor,
                          ),
                          // Background color
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          viewModel.checkAnswersModel.correctQuestions?.length
                                  .toString() ??
                              '0', // Number inside the circle
                          style: GoogleFonts.inter(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge)
                              .copyWith(color: ColorsManager.primaryColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24.h),
                        width: 30, // Circle size
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ColorsManager.red,
                          ),
                          // Background color
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          viewModel.checkAnswersModel.wrongQuestions?.length
                                  .toString() ??
                              '0', // Number inside the circle
                          style: GoogleFonts.inter(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge)
                              .copyWith(color: ColorsManager.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(343.w, 48.h),
                ),
                onPressed: () {},
                child: Text(StringsManager.ShowResult,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: ColorsManager.customBlue.shade50)),
              ),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                    side: BorderSide(color: ColorsManager.primaryColor),
                    fixedSize: Size(343.w, 48.h),
                    foregroundColor: ColorsManager.primaryColor,
                    backgroundColor: Colors.transparent),
                onPressed: () {
                  viewModel.processIntent(
                      NavigateToExamScreenIntent(context: context));
                },
                child: Text(
                  StringsManager.StartAgain,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorsManager.primaryColor),
                ),
              ),
              Spacer(
                flex: 5,
              )
            ]),
      ),
    );
  }
}

class CircleChart extends StatelessWidget {
  const CircleChart({super.key, required this.viewModel});
  final ExamCubit viewModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Text(
            '${viewModel.bluePercentage}%',
            style: GoogleFonts.poppins(
              fontSize: 25.sp,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          width: 250,
          child: SfCircularChart(
            enableMultiSelection: false,
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                dataSource: [
                  ChartData('Blue', viewModel.bluePercentage,
                      ColorsManager.primaryColor),
                  ChartData('Red', viewModel.redPercentage, ColorsManager.red),
                ],
                xValueMapper: (ChartData data, _) => data.label,
                yValueMapper: (ChartData data, _) => data.value,
                pointColorMapper: (ChartData data, _) => data.color,
                dataLabelSettings: DataLabelSettings(isVisible: false),
                radius: '60%',
                innerRadius: '90%',
                cornerStyle: CornerStyle.bothCurve,
                animationDuration: 900,
                legendIconType: LegendIconType.pentagon,
                enableTooltip: true,
                explode: true,
                explodeAll: true,
                explodeOffset: '5%',
                // groupTo: .35,
                groupMode: CircularChartGroupMode.value,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final String label;
  final int value;
  final Color color;

  ChartData(this.label, this.value, this.color);
}
