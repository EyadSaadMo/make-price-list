import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';




class SettingItemCheckBoxComponent extends StatelessWidget {
  const SettingItemCheckBoxComponent({Key? key, required this.text1, required this.text2, required this.value, required this.onChanged}) : super(key: key);
  final String text1;
  final String text2;
  final bool? value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text1,style:Theme.of(context).textTheme.bodyText1,),
            const SizedBox(height: 5,),
            Text(text2,style:Theme.of(context).textTheme.caption,),
          ],
        ),
        const Spacer(),
        Checkbox(value: value, onChanged: (val){onChanged;},activeColor:cubit.isDark?Colors.deepOrange:HexColor('454545'),checkColor:Colors.white, ),
      ],
    );
  },
);
  }
}
