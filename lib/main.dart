import 'package:flutter/material.dart';
import 'package:syboard/routes/welcome.dart';

void main() => runApp(MaterialApp(
  //home: Welcome(),
  //initialRoute: '/login',
  routes: {
    '/': (context) => Welcome(),
    // '/login': (context) => Login(),
    // '/signup': (context) => SignUp(),
  },
));
