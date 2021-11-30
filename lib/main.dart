import 'package:flutter/material.dart';
import 'package:syboard/routes/signup.dart';
import 'package:syboard/routes/welcome.dart';
import 'package:syboard/routes/login.dart';
import 'package:syboard/routes/walkthrough.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Welcome(),
      //initialRoute: '/walkthrough',
      routes: {
        '/': (context) => WalkThrough(),
        '/walkthrough': (context) => WalkThrough(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
      },
    ));
