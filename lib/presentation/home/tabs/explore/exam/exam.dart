import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/utils/assets_manager.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/presentation/home/tabs/explore/exam/widgets/custom_list_tile.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  final ScrollController _scrollController = ScrollController();
  final double _scrollAmount = 343.0.w;
  int currentQuestionNumber = 1;
  int totalQuestionNumber = 20; // Adjust scrolling distance
  bool _isScrolling = false; // Flag to track scroll state
  void _scrollNext() {
    if (_isScrolling) return;
    if (currentQuestionNumber < totalQuestionNumber) {
      currentQuestionNumber++;
      setState(() {});
    }
    _isScrolling = true;
    _scrollController
        .animateTo(
      _scrollController.offset + _scrollAmount,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    )
        .then((_) {
      _isScrolling = false;
    });
  }

  void _scrollBack() {
    if (_isScrolling) return;
    if (currentQuestionNumber > 1) {
      currentQuestionNumber--;
      setState(() {});
    }
    _isScrolling = true;
    _scrollController
        .animateTo(
      _scrollController.offset - _scrollAmount,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    )
        .then((_) {
      _isScrolling = false;
    });
  }

  final ValueNotifier<bool> _isLessThan5Minutes = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isLessThan5Minutes.dispose(); // Dispose the ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 48.0.h),
        child: Column(
            spacing: 8.h,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    //Navigator.pop(context);
                  },
                ),
                Text(
                  'Exam',
                  style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.headlineMedium),
                ),
                Spacer(),
                Image.asset(AssetsManager.timerIcon),
                Timer(isLessThan5Minutes: _isLessThan5Minutes),
              ]),
              Text('Question $currentQuestionNumber of $totalQuestionNumber',
                  style: Theme.of(context).textTheme.titleLarge),
              LinearProgressIndicator(
                value: currentQuestionNumber / totalQuestionNumber,
                color: ColorsManager.primaryColor,
              ),
              SizedBox(
                height: 370.h,
                width: 343.w,
                child: ListView.builder(
                  cacheExtent: 343.w * totalQuestionNumber,
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Question(),
                  itemCount: totalQuestionNumber,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Row(
                  spacing: 16.w,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            side: BorderSide(color: ColorsManager.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                            ),
                            fixedSize: Size(163.w, 48.h),
                            foregroundColor: ColorsManager.primaryColor,
                            backgroundColor: Colors.transparent),
                        onPressed:
                            currentQuestionNumber == 1 ? null : _scrollBack,
                        child: Text(
                          'Back',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: ColorsManager.primaryColor),
                        )),
                    TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fixedSize: Size(163.w, 48.h),
                          foregroundColor: ColorsManager.customBlue.shade50,
                          backgroundColor: ColorsManager.primaryColor),
                      onPressed: _scrollNext,
                      child: Text(
                          currentQuestionNumber == totalQuestionNumber
                              ? 'Submit'
                              : 'Next',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: ColorsManager.customBlue.shade50)),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 4,
              ),
            ]),
      ),
    );
  }
}

class Timer extends StatelessWidget {
  const Timer({
    super.key,
    required ValueNotifier<bool> isLessThan5Minutes,
  }) : _isLessThan5Minutes = isLessThan5Minutes;

  final ValueNotifier<bool> _isLessThan5Minutes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, left: 8.w),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isLessThan5Minutes,
        builder: (context, isLessThan5Minutes, child) {
          return TimerCountdown(
            enableDescriptions: false,
            format: CountDownTimerFormat.minutesSeconds,
            timeTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: isLessThan5Minutes ? Colors.red : Colors.green,
                ),
            endTime: DateTime.now().add(
              Duration(
                minutes: 5,
                seconds: 0,
              ),
            ),
            onEnd: () {
              print("Timer finished");
            },
            onTick: (duration) {
              // Update the ValueNotifier without calling setState
              _isLessThan5Minutes.value = duration.inMinutes < 5;
            },
          );
        },
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson, nothing, aza }

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  SingingCharacter? _character;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 332.h,
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
                'What does HTML stand for What does HTML stand for?',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            CustomRadioListTile(
              title: 'Lafayette',
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            CustomRadioListTile(
              title: 'Thomas Jefferson',
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  isPressed = true;
                  _character = value;
                });
              },
            ),
            CustomRadioListTile(
              title: 'noway',
              value: SingingCharacter.nothing,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            CustomRadioListTile(
              title: 'noway',
              value: SingingCharacter.aza,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
