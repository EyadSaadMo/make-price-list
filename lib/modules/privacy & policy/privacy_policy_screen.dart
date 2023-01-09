import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';

class RateAppScreen extends StatelessWidget {
  RateAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Privacy Policy',
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share_outlined,
                    color: Theme.of(context).iconTheme.color),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Privacy Policy',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Web Freeze Solution built the Make Price List app as a Free app. This SERVICE is provided by Web Freeze Solution at no cost and is intended for use as is.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Make Price List unless otherwise defined in this Privacy Policy.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Information Collection and Use',
                      style: TextStyle(color: Theme.of(context).primaryColor)
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'For a better experience, while using our Service, We may require you to provide us with certain personally identifiable information. The information that We request will be retained on your device and is not collected by me in any way.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'The app does use third-party services that may collect information used to identify you.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'Link to the privacy policy of third-party service providers used by the app',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('', style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Google Play Services ',
                              style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://policies.google.com/privacy');
                                }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text('Log Data',
                      style: TextStyle(color: Theme.of(context).primaryColor)
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'We want to inform you that whenever you use our Service, in a case of an error in the app We collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Cookies',   style: TextStyle(color: Theme.of(context).primaryColor)
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your devices internal memory.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Service Providers',
                      style: TextStyle(color: Theme.of(context).primaryColor)
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'We may employ third-party companies and individuals due to the following reasons',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('1- To facilitate our Service',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('2- To provide the Service on our behalf',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('3- To perform Service-related services',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('4- To assist us in analyzing how our Service is used.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'We want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Security',
                      style: TextStyle(color: Theme.of(context).primaryColor)
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and We cannot guarantee its absolute security.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Links to other Sites',
                      style: TextStyle(color: Theme.of(context).primaryColor)
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, We strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Changes to This Privacy Policy',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Contact Us',
                      style: TextStyle(color: Theme.of(context).primaryColor)
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      'If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Material(
                      textStyle:
                          TextStyle(decoration: TextDecoration.lineThrough),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'eyads3514@gmail.com ',
                            style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(AppCubit.get(context)
                                        .gmailUrl
                                        .toString());
                                  }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
