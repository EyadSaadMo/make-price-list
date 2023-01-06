import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';

import '../../../constatns/colors.dart';

class CustomContainer extends StatelessWidget {
  final Color? color;
  final Widget child;

  const CustomContainer(
      {this.color, required this.child, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .inputDecorationTheme
            .fillColor,
        // borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: child,
    );
  }
      }