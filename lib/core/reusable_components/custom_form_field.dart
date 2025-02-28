import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.title,
      required this.hintText,
      this.maxLine,
      this.obscure = false,
      this.keyboardType,
      this.suffixIcon,
      required this.controller,
      this.validation,
      this.enable,
      this.icon,
      this.onIconTap,
      this.IsEnable});

  final TextEditingController controller;
  final int? maxLine;
  final bool obscure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validation;
  final String hintText;
  final String title;
  final Widget? suffixIcon;
  final bool? enable;
  //final bool? isEnable;
  final IconData? icon;
  final void Function()? onIconTap;
  final String? Function(String?)? IsEnable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: IsEnable,
      enabled: enable ?? true,
      controller: controller,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),
      maxLines: maxLine ?? 1,
      obscuringCharacter: '*',
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validation,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
        enabled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4.r),
        ),
        focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
        hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 14.sp,
            ),
        hintText: hintText,
        labelText: title,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return TextStyle(color: Colors.red); // Red label in error state
          }
          return Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.black.withOpacity(0.7), // Default label color
                  ) ??
              TextStyle();
        }),
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
