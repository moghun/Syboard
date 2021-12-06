import 'package:flutter/material.dart';
import 'package:syboard/routes/signup.dart';
import 'package:syboard/routes/welcome.dart';
import 'package:syboard/routes/login.dart';
import 'package:syboard/routes/walkthrough.dart';
import 'index.dart';

void main() async {

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Index(),
      '/walkthrough': (context) => const WalkThrough(),
      '/welcome': (context) => Welcome(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
    },
  ));
}
