import 'package:flutter/material.dart';

import 'package:work/core/constatns/colors.dart';
import 'package:work/layout/layout_screen.dart';
import 'package:work/modules/setting/setting_screen.dart';

import '../routes/routes_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).drawerTheme.backgroundColor,
      child: Column(
        // Important: Remove any padding from the ListView.
        // padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Image(
                        image: AssetImage('assets/images/checklist.jpg'),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Make Price List',
                        style: Theme.of(context).textTheme.bodyText1
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Fast & Easy Price List Maker',
                        style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      const Icon(Icons.menu_rounded),
                      const SizedBox(
                        width: 10,
                      ),
                       Text(
                        'All items',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const Expanded(child: SizedBox()),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: defaultColor,
                        child: Text(
                          '2',
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                    navigateTo(context, HomeScreen());
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: textColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'CATEGORIES',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      const Icon(Icons.menu_rounded),
                      const SizedBox(
                        width: 10,
                      ),
                       Text(
                        'Uncategorized',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const Expanded(child: SizedBox()),
                      CircleAvatar(
                        backgroundColor: defaultColor,
                        radius: 10,
                        child: Text(
                          '2',
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                    navigateTo(context, HomeScreen());
                  },
                ),
                 // Expanded(child: SizedBox()),
                  SizedBox(height: 370,),
                // Expanded(child: Align(alignment: FractionalOffset.bottomCenter,)),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: textColor,
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Row(
                    children:  [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  onTap: (){
                    navigateTo(context, SettingScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
