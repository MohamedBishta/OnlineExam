import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors_manager.dart';
import '../exam.dart';

class CustomRadioListTile extends StatelessWidget {
  final String title;
  final SingingCharacter value;
  final SingingCharacter? groupValue;
  final ValueChanged<SingingCharacter?> onChanged;

  const CustomRadioListTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        iconColor: Colors.red,
        title: Text(title),
        leading: Radio<SingingCharacter>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          fillColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            return ColorsManager.primaryColor; // Color when not selected
          }),
        ),
        tileColor: ColorsManager.customBlue.shade50,
        selectedColor: ColorsManager.headTheme,
        selectedTileColor: ColorsManager.customBlue.shade100,
        selected: groupValue == value,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ));
  }
}
