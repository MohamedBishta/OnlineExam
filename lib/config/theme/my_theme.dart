import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';

class MyTheme{
  static  ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.primaryColor),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      shadowColor: Colors.transparent,
      toolbarHeight: 48.h
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.headTheme
      ),
      titleSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.textTheme),
    ),
    useMaterial3: true,
  );
}