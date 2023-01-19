import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:work/core/constatns/colors.dart';

class LoginWithGoogleScreen extends StatelessWidget {
  const LoginWithGoogleScreen({Key? key}) : super(key: key);

  googleLogin() async {
    // print('google method sign in');
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
       print(result);
      // print(result?.displayName);
      // print(result?.photoUrl);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account',style:Theme.of(context).textTheme.bodyText1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Image(
                    image: AssetImage('assets/images/login.jpg'),
                  )),
              const SizedBox(height: 10.0,),
              Text('Welcome to Make Price List',style:Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 10.0,),
              Text('Use your Google account',style: Theme.of(context).textTheme.caption),
              Text('to sign in to this app',style:Theme.of(context).textTheme.caption),
              const SizedBox(height: 20.0,),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    color: defaultColor,
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset('assets/images/google.jpg',fit: BoxFit.cover,),),
                        const SizedBox(width: 20,),
                        const Text('Sign in with Google'),
                      ],
                    ),
                  ),
                ),
                onTap: (){googleLogin();},
              )
            ],
          ),
        ),
      ),
    );
  }
}
