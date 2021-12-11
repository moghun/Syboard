import 'package:syboard/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/styles.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:syboard/utils/analytics-utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // String _message = '';
  // void setMessage(String msg){
  //   setState(() {
  //     _message = msg;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    setCurrentScreenUtil(analytics: widget.analytics, screenName: "welcomeScreen");
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 90.0, vertical: 0),
              child: Image.network(
                  'https://i.ibb.co/4Vw6XL0/logo-JPGblue-removebg.png'),
            ),
            Center(
              child: Padding(
                padding: Dimen.regularPadding,
                child: RichText(
                  text: TextSpan(
                    text: "Syboard",
                    style: kLogoTextStyle,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {
                        setLogEventUtil(analytics: widget.analytics, eventName: "clickSignupBtn");
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Sign Up',
                          style: kButtonDarkTextStyle,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimen.borderRadius),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {
                        //FirebaseAnalytics().logEvent(name: "clickLoginButton");
                        setLogEventUtil(analytics: widget.analytics, eventName: "clickLoginBtn");
                        Navigator.popAndPushNamed(context, '/login');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Log In',
                          style: kButtonDarkTextStyle,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimen.borderRadius),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
