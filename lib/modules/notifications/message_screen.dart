import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final String? payload;

  const MessageScreen({Key? key,required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('messages',style: Theme.of(context).textTheme.bodyText1,),
      ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24,),
            Text(payload ?? '  Happy New Year 2023 🎉',style: Theme.of(context).textTheme.bodyText1,),
            const SizedBox(height: 15,),
             Expanded(child: Text(' Wishing you a Happy New Year, bursting with fulfilling and exciting opportunities.And remember if opportunity doesn\'t knock, build a door May the New Year bring you happiness, peace,and prosperity. Wishing you a joyous 2023!',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 1.5,letterSpacing: 0.8),
            )),
          ],
        ),
      ),
    );
  }
}
