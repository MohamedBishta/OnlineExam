import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({super.key,required this.title,required this.hintText,this.maxLine = 1,this.obscure = false,
    this.keyboardType, this.icon,required this.controller,required this.validation,this.onIconTap});
  TextEditingController controller;
  int? maxLine;
  bool? obscure ;
  TextInputType? keyboardType;
  String? Function(String?) validation;
  String hintText;
  String title;
  IconData? icon;
  void Function()? onIconTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.titleSmall,
      maxLines: maxLine,
      obscureText: obscure!,
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle:Theme.of(context).textTheme.titleSmall,
        suffixIcon: InkWell(
          onTap: onIconTap,
            child: Icon(icon)),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
