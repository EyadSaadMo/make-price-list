import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constatns/colors.dart';

class BottomNavBarComponent extends StatefulWidget {
  const BottomNavBarComponent({Key? key}) : super(key: key);

  @override
  State<BottomNavBarComponent> createState() => _BottomNavBarComponentState();
}

class _BottomNavBarComponentState extends State<BottomNavBarComponent> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
          activeIcon: Container(
            padding: EdgeInsets.all(8),
            decoration:
            BoxDecoration(color: screenColor, shape: BoxShape.circle),
            child: Icon(
              Icons.camera_alt,
              size: 50,
              color: textColor,
            ),
          ),
          text: "Camera"),
      activeColor: textColor,
      navBarBackgroundColor: HexColor('#F2D0C6'),
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(

            activeIcon: Icon(
              Icons.home,
              color: textColor,
            ),
            inActiveIcon: Icon(
              Icons.home,
              color: textColor,
            ),
            text: 'Home',
        ),
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.wallet_giftcard,
              color: textColor,
            ),
            inActiveIcon: Icon(
              Icons.wallet_giftcard,
              color:textColor,
            ),
            text: 'Wallet'),

      ],
      bodyItems: [
        Container(
          color: screenColor,
        ),
        Container(
          color: screenColor,
        )
      ],
      actionBarView: Container(
        color: screenColor,
      ),
      extendBody: true,
    );
  }
}
