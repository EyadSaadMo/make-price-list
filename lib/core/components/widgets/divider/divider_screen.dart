import 'package:flutter/material.dart';

import '../../../constatns/colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Divider(height: 1,color: textColor,);
  }
}
