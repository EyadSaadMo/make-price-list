import 'package:flutter/material.dart';

import '../../core/components/widgets/default_form_field/defaultt_form_field_component.dart';


class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
var nameController = TextEditingController();
var emailController = TextEditingController();
var problemController = TextEditingController();
var formKey = GlobalKey<FormState>();
var scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
                'Help & Support',
                style: Theme.of(context).appBarTheme.titleTextStyle),
          ),
          body: ListView(
            children: [
              Image.asset('assets/images/checkListWomen3.jpg'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'if you are looking for more information or having issues in using this app, send us your query below.',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize:14 )),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('Full Name',style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormFieldComponent(
                        textInputType: TextInputType.name,
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Text('Email Address',style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormFieldComponent(
                        textInputType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('Your Question, Comment or Issues ',style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormFieldComponent(
                        textInputType: TextInputType.name,
                        controller: problemController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Builder(
                            builder: (context) {
                            return MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  final snackBar = SnackBar(
                                    backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
                                    content:  Text('your message are sent successfully',style: Theme.of(context).textTheme.bodyText1),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBar);
                                  // if(formKey.currentState!.validate()){
                                  //    // scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text('your message sent successfully')));
                                  //   // createSnackBar('your message sent successfully');
                                  //
                                  // }
                                }
                              },
                              color:Theme.of(context).primaryColor,
                              child: Text(
                                  'SAVE',
                                  style: Theme.of(context).textTheme.bodyText1),

                            );
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
void createSnackBar(String message) {
  final snackBar =  SnackBar(content:  Text(message),
      backgroundColor: Colors.red);

  // Find the Scaffold in the Widget tree and use it to show a SnackBar!
  scaffoldKey.currentState!.showSnackBar(snackBar);
}
}
