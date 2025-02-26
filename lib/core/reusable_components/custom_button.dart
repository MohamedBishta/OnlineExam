import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, required this.title, required this.onPressed, this.isEnable});
  String title;
  bool? isEnable = true;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isEnable == false ? null : onPressed, child: Text(title));
  }
}
