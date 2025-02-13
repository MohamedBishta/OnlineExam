import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed,this.backgroundColor});
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(343.w, 48.h),
        backgroundColor:backgroundColor?? ColorsManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(fontSize: 16.sp, color: Colors.white),
      ),
    );
  }
}
