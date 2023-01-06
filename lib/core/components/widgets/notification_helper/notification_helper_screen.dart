//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:work/modules/notifications/notifications_screen.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// import '../routes/routes_screen.dart';
// class NotificationHelper{
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   initializationNotification()async{
//     tz.initializeTimeZones();
//     // tz.setLocalLocation(tz.getLocation(timeZoneName));
//     AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('heart');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//     DarwinInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//     final InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsDarwin,);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:selectNotification('hello world'));
//   }
//
//
//
//
//
//    selectNotification(String? payload)  {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//       Get.to(NotificationsScreen());
//   }
//   displayNotification({required String title,required String body,}) async {
//     AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails(
//         'your channel id', 'your channel name',
//         channelDescription: 'your channel description',
//         importance: Importance.max,
//         priority: Priority.high,
//         ticker: 'ticker',
//         showWhen: false);
//     NotificationDetails notificationDetails =
//     NotificationDetails(android: androidNotificationDetails,);
//     await flutterLocalNotificationsPlugin.show(0, title, body,
//         notificationDetails,
//         payload: 'Default Sound');
//   }
//
//  scheduleNotification(int hour,int minutes,)async{
//    await flutterLocalNotificationsPlugin.zonedSchedule(0,'scheduled title','scheduled body',
//        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
//        const NotificationDetails(
//            android: AndroidNotificationDetails(
//                'your channel id', 'your channel name',
//                channelDescription: 'your channel description')),
//        androidAllowWhileIdle: true,
//        uiLocalNotificationDateInterpretation:
//        UILocalNotificationDateInterpretation.absoluteTime);
//
//  }
//
//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     Get.dialog(Text(body!));
//   }
// }