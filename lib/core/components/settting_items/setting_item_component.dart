import 'package:flutter/material.dart';

import '../../constatns/colors.dart';

class SettingItemComponent extends StatelessWidget {
  const SettingItemComponent({Key? key, required this.text1, required this.text2}) : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1,style: TextStyle(color: textColor),),
        const SizedBox(height: 5,),
        Text(text2,style: TextStyle(color: textColor.withOpacity(0.4),),),
        const SizedBox(height: 25,),
      ],
    );
  }
}
