import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syboard/routes/signup.dart';
import 'package:syboard/routes/welcome.dart';
import 'package:syboard/routes/login.dart';
import 'package:syboard/routes/walkthrough.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool initialStart = (prefs.getBool('initialStart') ?? false);

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: Welcome(),
    //initialRoute: '/walkthrough',
    routes: {
      '/': (context) => initialStart ? Welcome() : WalkThrough(),
      '/walkthrough': (context) => WalkThrough(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
    },
  ));
}
