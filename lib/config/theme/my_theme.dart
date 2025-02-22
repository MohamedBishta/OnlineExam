import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.primaryColor),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        toolbarHeight: 48.h),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.headTheme),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          color: ColorsManager.textTheme),
    ),
    useMaterial3: true,
  );
}


    /////////////////////////////////TextFromFieldDecoration///////////////////////////////////
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
      focusedErrorBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
      hintStyle: lightTheme.textTheme.titleSmall?.copyWith(
        fontSize: 14.sp,
      ),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: lightTheme.textTheme.titleSmall,
      fillColor: Colors.white,
      filled: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: REdgeInsets.all(14),
          backgroundColor: ColorsManager.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r)),
          textStyle: lightTheme.textTheme.headlineMedium
              ?.copyWith(fontSize: 16.sp, color: Colors.white)),
    ),


    /////////////////////////////////AppBarTheme//////////////////////////////////////////
        color: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        toolbarHeight: 48.h),

    ////////////////////////////////TextTheme/////////////////////////////////////////////