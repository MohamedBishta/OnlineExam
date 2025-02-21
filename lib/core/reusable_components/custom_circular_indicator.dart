import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:online_exam/core/utils/colors_manager.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitThreeBounce(
      color: ColorsManager.primaryColor,
      size: 30.w,
    ));
  }
}
