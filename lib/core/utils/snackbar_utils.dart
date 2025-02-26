import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/utils/colors_manager.dart';

class SnackBarUtils {
  static void showSnackBar({
    required BuildContext context,
    required String text,
    int seconds = 1,
  }) {
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: seconds),
      backgroundColor: ColorsManager.customGray.shade300,
      content: Text(
        text,
        style: GoogleFonts.poppins(
            textStyle:
                const TextStyle(color: ColorsManager.headTheme, fontSize: 16)),
      ),
    );
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(snackBar);
  }
}
