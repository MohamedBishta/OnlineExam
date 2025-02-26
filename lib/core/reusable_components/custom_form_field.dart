import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {super.key,
      required this.title,
      required this.hintText,
      this.maxLine = 1,
      this.obscure = false,
      this.keyboardType,
      this.icon,
      required this.controller,
      required this.validation,
      this.onIconTap,
      required this.IsEnable});
  TextEditingController controller;
  int? maxLine;
  bool? obscure;
  TextInputType? keyboardType;
  String? Function(String?) validation;
  String? Function(String?) IsEnable;

  String hintText;
  String title;
  IconData? icon;
  void Function()? onIconTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: IsEnable,
      controller: controller,
      style: Theme.of(context).textTheme.titleSmall,
      maxLines: maxLine,
      obscureText: obscure!,
      keyboardType: keyboardType,
      validator: validation,
      decoration: InputDecoration(
        enabled: true,
        hintText: hintText,
        labelText: title,
        suffixIcon: InkWell(onTap: onIconTap, child: Icon(icon)),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
