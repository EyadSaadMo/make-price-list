import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:work/core/constatns/colors.dart';
import 'package:work/core/constatns/constant.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  @override
  // void initState() {
  //   flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();
  //   var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var initSetting = InitializationSettings(android: android);
  //   FlutterLocalNotificationsPlugin.initialize(initSetting,OnSelectNotification:selectNotification);
  //   super.initState();
  // }
  //
  // Future? selectNotification(String payload){
  //   print(payload);
  //   showDialog(context: context, builder: (context)=>AlertDialog(
  //     title: Text('Notifications'),
  //     content: Text(payload),
  //   ));
  //
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AppCubit()..createDataBase(),
  child: BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    if(state is AppInsertedInDatabaseSuccessState){
      Navigator.pop(context);
    }
    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: defaultColor,
        title: Text('Notifications',style: TextStyle(color: textColor),),
      ),
      // bottomNavigationBar: Container(
      //   height: 70,
      //   color: defaultColor,
      // ),
      // body: Center(
      //   child: Container(
      //     width: 100,
      //     height: 100,
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: defaultColor
      //     ),
      //   ),
      // ),

      body:state is !AppGetDatabaseLoadingState ?ListView.separated(itemBuilder: (ctx,index)=>buildItem(cubit.unCategoriesList[index]),
        scrollDirection: Axis.vertical,
        itemCount: cubit.unCategoriesList.length,separatorBuilder: (ctx,index)=>Container(
        height: 1,color: Colors.grey[300],
      ),
      ):Center(child: CircularProgressIndicator(),),
    );
  },
),
);
  }
  // showNotification()async{
  //   var android = const AndroidNotificationDetails('channelId', 'channelName',priority: Priority.high,importance: Importance.max );
  //   var platform =  NotificationDetails(android: android);
  //
  //   await FlutterLocalNotificationsPlugin.show(0,'Eyad Saad','hello world',platform,payload: 'this is my nam');
  // }
buildItem(Map model){
    return Container(
      height: 50,
      color: Colors.blue,
      child: Row(
        children: [
          Text(model['name'],style: TextStyle(color: Colors.white),),

        ],
      ),
    );
}
}
