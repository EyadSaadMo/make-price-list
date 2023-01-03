// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:work/modules/onBoarding/onBoarding_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         const Duration(seconds: 3),
//             () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//             builder: (BuildContext context) => const OnBoardingScreen())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Text('hhhhhhhhhhhhhhhhhhhhhhhhh'),
//       ),
//     );
//   }
// }