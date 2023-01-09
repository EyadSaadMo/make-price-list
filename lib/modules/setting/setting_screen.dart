import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/core/components/widgets/routes/routes_screen.dart';
import 'package:work/core/constatns/colors.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';
import 'package:work/modules/google%20login/login_with_google_screen.dart';
import 'package:store_redirect/store_redirect.dart';
import '../../core/components/widgets/divider/divider_screen.dart';
import '../../core/components/widgets/settting_items/setting_checkbox_item_component.dart';
import '../../core/components/widgets/settting_items/setting_item_component.dart';
import '../Help&Support/help_support_screen.dart';
import '../privacy & policy/privacy_policy_screen.dart';
class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);
 var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title:  Text('setting',style: Theme.of(context).appBarTheme.titleTextStyle,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
             Text('Account',style:Theme.of(context).textTheme.bodyText2,),
            const SizedBox(height: 25,),
         InkWell(
           child: SettingItemComponent(text1: 'Sign In ', text2: 'Tap to sign in with your account',),
             onTap: (){
             navigateTo(context,LoginWithGoogleScreen() );
           },
         ),
             Text('General',style:Theme.of(context).textTheme.bodyText2,),
            const SizedBox(height: 25,),
          InkWell(child: SettingItemComponent(text1: 'Currency', text2: 'United  States Dollar()'),onTap: (){
            showCurrencyPicker(context: context,
                showFlag: true,
                showSearchField: true,
                showCurrencyName: true,
                showCurrencyCode: true,
                searchHint: 'select your currency',
                favorite:['EGP'] ,
                onSelect: (currency){
              print('Selected currency ${currency.name}');
                });
          },),
             Text('Display',style:Theme.of(context).textTheme.bodyText2,),
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
           InkWell(
             child: SettingItemComponent(text1: 'Theme', text2: 'Light',),
             onTap: ()
             {
               scaffoldKey.currentState!.showBottomSheet((context) => Container(
                 height: 200,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     const SizedBox(height: 10,),
                     Text('Choose Theme',style: Theme.of(context).textTheme.bodyText1,),
                     const SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         InkWell(
                           child: Container(
                             width: 100,
                             height: 100,
                             decoration: BoxDecoration(
                                 color: textColor,
                                 shape: BoxShape.rectangle
                             ),
                           ),
                           onTap: (){
                             cubit.changeAppMode();
                             Navigator.pop(context);
                           },
                         ),
                         Container(
                           width: 100,
                           height: 100,
                           decoration: BoxDecoration(
                               color: screenColor,
                               shape: BoxShape.rectangle
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ));
             },
           ),
             Text('Backup & Restore',style:Theme.of(context).textTheme.bodyText2,),
            const SizedBox(height: 25,),
           InkWell(child: SettingItemComponent(text1: 'Backup Data', text2: 'Last Backup: Never'),onTap: (){
             showAlertDialog(text1: 'Cancel', text2: 'sign in ', alertTitle: 'Sign In Required', alertBody: 'you must sign in t use this feature',context: context);
           },),
            const MyDivider(),
            const SizedBox(height: 15,),
           InkWell(child: SettingItemComponent(text1: 'Restore Data', text2: 'Last Restore: Never'),onTap: (){
             showAlertDialog(text1: 'Cancel', text2: 'sign in ', alertTitle: 'Sign In Required', alertBody: 'you must sign in t use this feature',context: context);
           },),
            const MyDivider(),
            const SizedBox(height: 15,),
           InkWell(child: SettingItemComponent(text1: 'Clear All Data', text2: 'Tap to delete all the data'),onTap: (){
             showAlertDialog(text1: 'No', text2: 'yes', alertTitle: 'Confirmation', alertBody: 'Are you sure you wanna clear all the data on this device? this action cannot be undone',context: context);
           },),
             Text('Info',style:Theme.of(context).textTheme.bodyText2,),
            const SizedBox(height: 25,),
           InkWell(child: SettingItemComponent(text1: 'Help & Support', text2: ' Tap to contact us'),onTap: (){
             navigateTo(context, HelpAndSupportScreen());
           },),
            const MyDivider(),
            const SizedBox(height: 15,),
           InkWell(child: SettingItemComponent(text1: 'Rate This App', text2: ' Tap to rate on Google play'),onTap: ()async {
             StoreRedirect.redirect(
               androidAppId: 'com.zhiliaoapp.musically'
             );
           },),
            const MyDivider(),
            const SizedBox(height: 15,),
           InkWell(child: SettingItemComponent(text1: 'Privacy Policy', text2: ' Tap to view'),
           onTap: (){
             navigateTo(context, RateAppScreen());
           },),
            const MyDivider(),
            const SizedBox(height: 15,),
           SettingItemComponent(text1: 'Version', text2: ' 1.00'),

          ],
        ),
      ),
    );
  },
);
  }
  showAlertDialog({
     BuildContext? context, required String? text1, required String? text2, required String? alertTitle, required String? alertBody,
  }) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(text1!.toUpperCase(),style:TextStyle(color:Theme.of(context!).primaryColor ) ,),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text(text2!.toUpperCase(),style:TextStyle(color:Theme.of(context).primaryColor ) ,),
      onPressed:  () {
        navigateTo(context, LoginWithGoogleScreen());
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(alertTitle!,style:TextStyle(color:Theme.of(context).primaryColor ) ,),
      content: Text(alertBody!),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
