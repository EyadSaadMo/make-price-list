import 'package:flutter/material.dart';

import '../../../constatns/colors.dart';


class DefaultFormFieldComponent extends StatelessWidget {
   DefaultFormFieldComponent({Key? key, required this.textInputType, required this.controller, required this.validator,this.suffixIcon,this.hintText}) : super(key: key);

  final TextInputType textInputType;
  final TextEditingController controller;
  final FormFieldValidator validator;
  Widget? suffixIcon;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: defaultColor,
      keyboardType: textInputType,
      decoration: InputDecoration(
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        suffixIcon: suffixIcon,
        hintText: hintText,

      ),
    );
  }
}
