import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  final Color? color;
  final Widget child;

  const CustomContainer(
      {super.key, this.color, required this.child, });

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