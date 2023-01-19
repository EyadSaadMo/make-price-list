import 'package:flutter/material.dart';

class DefaultFormFieldComponent extends StatelessWidget {
   DefaultFormFieldComponent({Key? key, required this.textInputType, required this.controller, required this.validator,this.suffixIcon,this.hintText,this.onSave,this.onChange}) : super(key: key);

  final TextInputType textInputType;
  final TextEditingController controller;
  final FormFieldValidator validator;
  Widget? suffixIcon;
  String? hintText;
  Function? onSave;
  Function? onChange;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      validator: validator,
      onSaved: (value){onSave;},
      onChanged: (value){onChange;},
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: textInputType,
      decoration: InputDecoration(
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        suffixIcon: suffixIcon,
        hintText: hintText,hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey.withOpacity(0.4)),

      ),
    );
  }
}
