import 'package:flutter/material.dart';
import 'package:work/core/components/widgets/routes/routes_screen.dart';
import 'package:work/modules/notifications/second_page.dart';
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
  void onClickedNotification(String? payload)=>navigateTo(context, SecondPageScreen(payload: payload));
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
                icon: Text(
                  'Show Notifications',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),

        );
  }

}
// body:state is !AppGetDatabaseLoadingState ?ListView.separated(itemBuilder: (ctx,index)=>buildItem(cubit.unCategoriesList[index]),
//   scrollDirection: Axis.vertical,
//   itemCount: cubit.unCategoriesList.length,separatorBuilder: (ctx,index)=>Container(
//   height: 1,color: Colors.grey[300],
// ),
// ):Center(child: CircularProgressIndicator(),),
/*
buildItem(Map model){
    return Container(
      height: 50,
      color: Colors.blue,
      child: Row(
        children: [
          Text(model['name'],style: Theme.of(context).textTheme.bodyText1),

        ],
      ),
    );
}
 */

/*
 Widget buildItem(
    Map model,
  ) {
    return Container(
      height: 80,
      color: Theme.of(context).bottomSheetTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(model['name'],
                    style: Theme.of(context).textTheme.bodyText1),
                Text(model['salePrice'].toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppCubit.get(context).isDark
                            ? HexColor('808000')
                            : HexColor('800000'))),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text('Size/Weight:' ' ${model['weight'].toString()}',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.grey.shade600)),
            const SizedBox(
              height: 5,
            ),
            Text('Quantity:' ' ${model['quantity'].toString()}',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
 */