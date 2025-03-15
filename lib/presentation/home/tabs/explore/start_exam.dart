import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/reusable_components/custom_button.dart';
import 'package:online_exam/presentation/home/tabs/explore/exam/exam.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/strings_manager.dart';

class StartExam extends StatelessWidget {
  const StartExam({super.key, this.subjectName, this.duration, this.questions, this.examId});
  final subjectName;
  final duration;
  final questions;
  final examId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios, size: 20.sp),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Image(image: AssetImage('assets/images/Profit.png')),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    subjectName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Spacer(),
                  Text(
                    '$duration ${StringsManager.Minutes}' ?? 'No Duration',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: ColorsManager.customBlue),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(children: <Widget>[
                Text('$questions ${StringsManager.Question}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16)),
              ],),
              Divider(
                color: ColorsManager.customBlue.shade50,
              ),
              Row(
                children: <Widget>[
                  Text(
                    StringsManager.Instructions,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Text("1️⃣ ${StringsManager.Instructions_1}"),
              Text("2️⃣ ${StringsManager.Instructions_2}"),
              Text("3️⃣ ${StringsManager.Instructions_3}"),
              Text("4️⃣ ${StringsManager.Instructions_4}"),
              SizedBox(height: 50.h,),
              CustomButton(title: StringsManager.Start,
                onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ExamScreen(examId: examId,),));
              },)

            ],
          ),
        ),
      ),
    );
  }
}
