import 'package:flutter/material.dart';
import 'package:work/core/components/widgets/routes/routes_screen.dart';
import 'package:work/modules/notifications/message_screen.dart';
import '../../core/components/notification_helper/notification_helper_screen.dart';

class NotificationsScreen extends StatefulWidget {
   NotificationsScreen({Key? key,}) : super(key: key);
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationApi.init();
    listenNotifications();
  }
  void listenNotifications()=> NotificationApi.onNotifications.stream.listen(onClickedNotification);
  void onClickedNotification(String? payload)=>navigateTo(context, MessageScreen(payload: payload));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Notifications',
                style: Theme.of(context).appBarTheme.titleTextStyle),
          ),
          bottomNavigationBar: Container(
            height: 70,
            color: Theme.of(context).inputDecorationTheme.fillColor,
          ),
          body: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              child: IconButton(
                onPressed: () {
                  NotificationApi.showNotification(
                      title: 'eyad saad',
                      body: 'read your notification',
                      payload: 'list.apps',
                  );
                },
                icon:Icon(Icons.notifications_none_outlined,color: Theme.of(context).iconTheme.color,)
              ),
            ),
          ),

        );
  }

}