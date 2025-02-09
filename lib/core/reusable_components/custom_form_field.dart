import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({super.key,required this.title,required this.hintText,this.maxLine,this.obscure = false,
    this.keyboardType, this.icon,required this.controller,required this.validation});
  TextEditingController controller;
  int? maxLine;
  bool obscure ;
  TextInputType? keyboardType;
  String? Function(String?) validation;
  String hintText;
  String title;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.titleSmall,
      maxLines: maxLine,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validation,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r)
        ),
        enabled: true,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r)
        ),
        hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: 14.sp,
        ),
        hintText: hintText,
        labelText: title,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelStyle:Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.black.withOpacity(0.7)
        ) ,
        suffixIcon: Icon(icon),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
