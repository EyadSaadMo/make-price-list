import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:work/core/constatns/colors.dart';
import 'package:work/layout/layout_screen.dart';
import 'package:work/models/onBoardimg_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var onBoardingController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) =>
                  buildOnBoardingItem(model[index], context),
              physics: BouncingScrollPhysics(),
              controller: onBoardingController,
              itemCount: model.length,
              onPageChanged: (int index) {
                if (index == model.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnBoardingItem(OnBoardingModel model, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image(
              image: AssetImage(model.image),
            )),
        const SizedBox(
          height: 20,
        ),
        Text(
          model.text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            model.body,
            maxLines: 2,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        const Expanded(child: SizedBox()),
        Container(
          color: defaultColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (ctx) =>  HomeScreen())));
                },
                child: const Text('Skip'),
                style: TextButton.styleFrom(
                  primary: Colors.black, // Text Color
                ),
              ),

              Row(
                children: [
                  SmoothPageIndicator(
                    controller: onBoardingController,
                    count: 3,
                    effect:  ExpandingDotsEffect(
                      dotColor: screenColor,
                      activeDotColor: Colors.black,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 5,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (isLast) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    onBoardingController.nextPage(
                        duration: const Duration(microseconds: 3),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: const Text('Next'),
                style: TextButton.styleFrom(
                  primary: Colors.black, // Text Color
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
