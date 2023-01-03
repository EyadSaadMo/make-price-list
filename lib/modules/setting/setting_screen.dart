import 'package:flutter/material.dart';
import 'package:work/core/components/divider/divider_screen.dart';
import 'package:work/core/components/settting_items/setting_checkbox_item_component.dart';
import 'package:work/core/components/settting_items/setting_item_component.dart';
import 'package:work/core/constatns/colors.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: screenColor,
        title:  Text('setting',style: TextStyle(color: textColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text('Account',style: TextStyle(color: Colors.deepOrangeAccent),),
            const SizedBox(height: 25,),
          const SettingItemComponent(text1: 'Sign In ', text2: 'Tap to sign in with your account'),
            const Text('General',style: TextStyle(color: Colors.deepOrangeAccent),),
            const SizedBox(height: 25,),
           const SettingItemComponent(text1: 'Currency', text2: 'United  States Dollar()'),
            const Text('Display',style: TextStyle(color: Colors.deepOrangeAccent),),
            const SizedBox(height: 25,),
            SettingItemCheckBoxComponent(text1: 'Show Size/Weigh', text2: 'Show size/weight in item list',value: true,onChanged: (val){}),
            const MyDivider(),
            const SizedBox(height: 15,),
            SettingItemCheckBoxComponent(text1: 'Show Quantity ', text2: 'Show quantity in item list',value: true,onChanged: (val){}),
            const MyDivider(),
            const SizedBox(height: 15,),
            SettingItemCheckBoxComponent(text1: 'Show Sales Price ', text2: 'Show sales price in item list',value: true,onChanged: (val){}),
            const MyDivider(),
            const SizedBox(height: 15,),
            SettingItemCheckBoxComponent(text1: 'Show Cost Price ', text2: 'Show cost price in item list',value: true,onChanged: (val){}),
            const SizedBox(height: 15,),
            SettingItemCheckBoxComponent(text1: 'Show Created/Updated Date ', text2: 'Show ted/update date in item detail',value: true,onChanged: (val){}),
            const MyDivider(),
            const SizedBox(height: 15,),
            SettingItemCheckBoxComponent(text1: 'Show Label Color', text2: 'Show label color in item list',value: true,onChanged: (val){}),
            const SizedBox(height: 15,),
            SettingItemCheckBoxComponent(text1: 'Show Description', text2: 'Show description in item detail',value: true,onChanged: (val){}),
            const MyDivider(),
            const SizedBox(height: 15,),
            const SettingItemComponent(text1: 'Theme', text2: 'Light'),
            const Text('Backup & Restore',style: TextStyle(color: Colors.deepOrangeAccent),),
            const SizedBox(height: 25,),
            const SettingItemComponent(text1: 'Backup Data', text2: 'Last Backup: Never'),
            const MyDivider(),
            const SizedBox(height: 15,),
            const SettingItemComponent(text1: 'Restore Data', text2: 'Last Restore: Never'),
            const MyDivider(),
            const SizedBox(height: 15,),
            const SettingItemComponent(text1: 'Clear All Data', text2: 'Tap to delete all the data'),
            const Text('Info',style: TextStyle(color: Colors.deepOrangeAccent),),
            const SizedBox(height: 25,),
            const SettingItemComponent(text1: 'Help & Support', text2: ' Tap to contact us'),
            const MyDivider(),
            const SizedBox(height: 15,),
            const SettingItemComponent(text1: 'Rate This App', text2: ' Tap to rate on Google play'),
            const MyDivider(),
            const SizedBox(height: 15,),
            const SettingItemComponent(text1: 'Privacy Policy', text2: ' Tap to view'),
            const MyDivider(),
            const SizedBox(height: 15,),
            const SettingItemComponent(text1: 'Version', text2: ' 9.3(4300)'),

          ],
        ),
      ),
    );
  }
}
