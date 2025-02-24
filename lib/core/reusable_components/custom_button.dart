import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,required this.title,required this.onPressed,required this.isEnable});
  String title;
  bool isEnable;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:isEnable==false?null:onPressed,
        child: Text(title)

    );
  }
}
