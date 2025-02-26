import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';

class MyTheme {
  static final TextTheme _textTheme = TextTheme(
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: ColorsManager.headTheme,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: ColorsManager.textTheme,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.primaryColor),
    scaffoldBackgroundColor: Colors.white,

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
      hintStyle: _textTheme.titleSmall?.copyWith(
        fontSize: 14.sp,
      ),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: _textTheme.titleSmall,
      fillColor: Colors.white,
      filled: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: REdgeInsets.all(14),
        backgroundColor: ColorsManager.primaryColor,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        textStyle: _textTheme.headlineMedium!.copyWith(
          fontSize: 16.sp,
        ),
      ),
    ),

    /////////////////////////////////AppBarTheme//////////////////////////////////////////
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        toolbarHeight: 48.h),

    ////////////////////////////////TextTheme/////////////////////////////////////////////
    textTheme: _textTheme,

    useMaterial3: true,
  );
}
