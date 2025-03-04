import 'package:flutter/material.dart';

//Color(0xffEDEFF3)
class ColorsManager {
  static const int _baseBlueColor = 0xFF02369C;
  static const int _baseGrayColor = 0xFF0F0F0F;
  static const Color primaryColor = Color(_baseBlueColor);
  static const Color headTheme = Color(0xff0F0F0F);
  static const Color textTheme = Color(0xff535353);
  static const Color babyBlue = Color(0xff02369C);
  static const Color green = Color(0xff11CE19);
  static const Color red = Color(0xffCC1010);

  static const MaterialColor customBlue = MaterialColor(
    _baseBlueColor,
    <int, Color>{
      50: Color(0xFFEDEFF3),
      100: Color(0xFFCCD7EB), // 10%
      150: Color(0xFFABBCDE), // 20%
      200: Color(0xFF819BCE), // 30%
      300: Color(0xFF5679BD), // 40%
      400: Color(0xFF2C58AD), // 50%
      500: Color(_baseBlueColor), // Base
      600: Color(0xFF022D82), // 60%
      700: Color(0xFF012468), // 70%
      800: Color(0xFF011B4E), // 80%
      900: Color(0xFF011234), // 90%
      1000: Color(0xFF000B1F), // 100%
    },
  );

  static const MaterialColor customGray = MaterialColor(
    _baseGrayColor,
    <int, Color>{
      50: Color(0xFFCFCFCF), // 10%
      100: Color(0xFFAFafAF), // 20%
      200: Color(0xFF878787), // 30%
      300: Color(0xFF5F5F5F), // 40%
      400: Color(0xFF373737), // 50%
      500: Color(_baseGrayColor), // Base
      600: Color(0xFF0D0D0D), // 60%
      700: Color(0xFF0A0A0A), // 70%
      800: Color(0xFF080808), // 80%
      900: Color(0xFF050505), // 90%
      1000: Color(0xFF030303), // 100%
    },
  );
}
