import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi{
  final AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('@drawable/ic_list');
  static final notifications = FlutterLocalNotificationsPlugin();
   static final onNotifications = BehaviorSubject<String?>();
  static Future notificationDetails()async{
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id','channel name',
        channelDescription: 'hello world',
        importance: Importance.max,
        icon: "@drawable/ic_list",
        priority: Priority.max,
      ),
    );
  }
  static Future init({bool initScheduled= false})async{
    const android = AndroidInitializationSettings('@drawable/ic_list');
    const settings = InitializationSettings(android: android);

    await notifications.initialize(settings,onDidReceiveNotificationResponse: (payload)async{
      onNotifications.add(payload.toString());
    });
  }
  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  })async=>
      notifications.show(id, title, body,await notificationDetails(),payload: payload,);
}