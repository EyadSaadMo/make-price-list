import 'package:flutter/material.dart';


class SettingItemComponent extends StatelessWidget {
   SettingItemComponent({Key? key, required this.text1, required this.text2,}) : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text1,style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 5,),
          Text(text2,style: Theme.of(context).textTheme.caption),

          const SizedBox(height: 25,),
        ],
      ),
    );
  }
}
