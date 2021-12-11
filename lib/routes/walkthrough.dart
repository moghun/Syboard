import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/routes/welcome.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:syboard/utils/analytics-utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({Key? key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  final controller = PageController(initialPage: 0);
  var walkTitle = [
    "Welcome to Syboard",
    "Sign Up Easily",
    "Login Quickly",
    "Let's Start"
  ];

  var imTitle = [
    "A market place for all electronic devices",
    "Create your account",
    "Login to your account and...",
    "Have a great time!"
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics().setCurrentScreen(screenName: "walkthroughScreen");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(00.0),
        child: AppBar(
          backgroundColor: Colors.grey[800],
        ),
      ),
      body: PageView(
        pageSnapping: true,
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            color: AppColors.walkthroughBg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SafeArea(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        walkTitle[0],
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: AssetImage("lib/images/syboard.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey[550],
                        size: 20,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                    ]),
                SizedBox(
                  height: 25,
                ),
                SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        imTitle[0],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Container(
            color: AppColors.walkthroughBg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SafeArea(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        walkTitle[1],
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: AssetImage("lib/images/signup.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[550],
                        size: 20,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                    ]),
                SizedBox(
                  height: 25,
                ),
                SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        imTitle[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Container(
            color: AppColors.walkthroughBg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SafeArea(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        walkTitle[2],
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: AssetImage("lib/images/login.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[550],
                        size: 20,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                    ]),
                const SizedBox(
                  height: 25,
                ),
                SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        imTitle[2],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Container(
            color: AppColors.walkthroughBg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SafeArea(
                    child: Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        walkTitle[3],
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: AssetImage("lib/images/arrow.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[700],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[550],
                        size: 20,
                      ),
                    ]),
                SizedBox(
                  height: 25,
                ),
                SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        imTitle[3],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.grey[750],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              side: BorderSide(
                                  width: 2, color: AppColors.primary),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: Text(
                                "Start",
                                style: kButtonLight,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onPressed: () async {
                              setLogEventUtil(analytics: widget.analytics, eventName: "finishingWalkthrough");
                              SharedPreferences prefs = await SharedPreferences.getInstance();

                              await prefs.setBool('initialStart', true);
                               Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Welcome()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
