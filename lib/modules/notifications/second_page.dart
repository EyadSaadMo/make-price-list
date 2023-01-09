import 'package:flutter/material.dart';

class SecondPageScreen extends StatelessWidget {
  final String? payload;

  const SecondPageScreen({Key? key,required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body:Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(payload ?? '',style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,),
            const SizedBox(height: 24,),
            Text('PAYLOAD',style: TextStyle(fontSize: 32),),
          ],
        ),
      ),
    );
  }
}
