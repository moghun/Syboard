import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/routes/welcome.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({Key? key}) : super(key: key);

  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  final controller = PageController(initialPage: 0);
  var AppBarTitles = ["WELCOME", "SIGNUP", "LOGIN", "GET STARTED"];
  var PageTitles = [
    "Welcome to Syboard",
    "Sign Up Easily",
    "Login Quickly",
    "Let's Start"
  ];
  var ImageURLs = [
    "https://i.ibb.co/4Vw6XL0/logo-JPGblue-removebg.png",
    "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F13%2F2015%2F04%2F05%2Ffeatured.jpg&q=85",
    "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F13%2F2015%2F04%2F05%2Ffeatured.jpg&q=85",
    "https://i.ibb.co/4Vw6XL0/logo-JPGblue-removebg.png"
  ];
  var ImageCaptions = [
    "A market place for all electronic devices",
    "Create your account",
    "Login to your account and...",
    "Have a great time!"
  ];

  @override
  Widget build(BuildContext context) {
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
                        padding:EdgeInsets.all(50),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              PageTitles[0],
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
                      height: MediaQuery.of(context).size.height / 2.7,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: AssetImage("lib/images/bart.jpg"),
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
                        size: 20,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
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
                          padding: EdgeInsets.only(top:70),
                          child: Text(
                            ImageCaptions[0],
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
                      padding:EdgeInsets.all(50),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            PageTitles[1],
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
                      height: MediaQuery.of(context).size.height / 2.7,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: AssetImage("lib/images/bart.jpg"),
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
                        size: 20,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
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
                          padding: EdgeInsets.only(top:70),
                          child: Text(
                            ImageCaptions[1],
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
                      padding:EdgeInsets.all(50),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            PageTitles[2],
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
                      height: MediaQuery.of(context).size.height / 2.7,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: AssetImage("lib/images/bart.jpg"),
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
                        size: 20,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
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
                          padding: EdgeInsets.only(top:70),
                          child: Text(
                            ImageCaptions[2],
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
                      padding:EdgeInsets.only(top:50, bottom:50),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            PageTitles[3],
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
                      height: MediaQuery.of(context).size.height / 2.7,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: AssetImage("lib/images/bart.jpg"),
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
                        size: 20,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey[350],
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
                          padding: EdgeInsets.only(top:70),
                          child: Text(
                            ImageCaptions[3],
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
                              height: 60,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.grey[750],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  side:
                                  BorderSide(width: 2, color: AppColors.primary),
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
                                onPressed: () {
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
      backgroundColor: Colors.grey[200],
    );
  }
}
