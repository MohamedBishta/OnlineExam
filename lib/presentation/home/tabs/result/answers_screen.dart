import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/utils/colors_manager.dart';

class AnswersScreen extends StatelessWidget {
  const AnswersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Answers',
          style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Answer();
        },
        itemCount: 10,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  const Answer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.h,
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
            "What is the capital of France?",
            style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
              child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return CustomRadioListTile(
                title: "Option ${index + 1}",
                isCorrect: index == 0,
                isChosen: index == 1,
              );
            },
          )),
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
          onChanged: (value) {},
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
