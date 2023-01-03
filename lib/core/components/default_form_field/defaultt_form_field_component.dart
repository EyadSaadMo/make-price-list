import 'package:flutter/material.dart';

import '../../constatns/colors.dart';

class DefaultFormFieldComponent extends StatelessWidget {
   DefaultFormFieldComponent({Key? key, required this.textInputType, required this.controller, required this.validator,this.suffixIcon}) : super(key: key);

  final TextInputType textInputType;
  final TextEditingController controller;
  final FormFieldValidator validator;
  Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: defaultColor,
      keyboardType: textInputType,
      decoration: InputDecoration(
          filled: true,
          fillColor: defaultColor,
          border: InputBorder.none,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
