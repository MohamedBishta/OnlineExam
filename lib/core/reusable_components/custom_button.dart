import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,required this.title,required this.onPressed});
  String title;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: REdgeInsets.all(14),
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r)
          )
        ),
        child: Text(title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 16.sp,
          color: Colors.white
        ),));
  }
}
