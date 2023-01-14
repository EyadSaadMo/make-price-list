import 'package:flutter/material.dart';

void navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>widget));
void navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (ctx)=>widget),
  (Route<dynamic> route) => false,
);
void navigateReplacement(context,widget)=>Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (ctx)=>widget),
);
