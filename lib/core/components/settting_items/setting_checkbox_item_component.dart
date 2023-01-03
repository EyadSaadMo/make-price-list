import 'package:flutter/material.dart';

import '../../constatns/colors.dart';

class SettingItemCheckBoxComponent extends StatelessWidget {
  const SettingItemCheckBoxComponent({Key? key, required this.text1, required this.text2, required this.value, required this.onChanged}) : super(key: key);
  final String text1;
  final String text2;
  final bool? value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text1,style: TextStyle(color: textColor),),
            const SizedBox(height: 5,),
            Text(text2,style: TextStyle(color: textColor.withOpacity(0.4),),),
          ],
        ),
        const Spacer(),
        Checkbox(value: value, onChanged: (val){onChanged;}),
      ],
    );
  }
}
