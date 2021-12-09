import 'package:flutter/material.dart';
import 'package:syboard/routes/signup.dart';
import 'package:syboard/routes/welcome.dart';
import 'package:syboard/routes/login.dart';
import 'package:syboard/routes/walkthrough.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'index.dart';



void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyFirebaseApp());
}

class MyFirebaseApp extends StatefulWidget {
  const MyFirebaseApp({Key? key}) : super(key: key);

  @override
  _MyFirebaseAppState createState() => _MyFirebaseAppState();
}

class _MyFirebaseAppState extends State<MyFirebaseApp> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('No Firebase Connection: ${snapshot.error.toString()}'),
              ),
            ),
          );
        }
        if(snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: {
                '/': (context) => Index(),
                '/walkthrough': (context) => const WalkThrough(),
                '/welcome': (context) => Welcome(),
                '/login': (context) => Login(),
                '/signup': (context) => SignUp(),
              },
            ),
          );
        }
        return const MaterialApp(
          home: Center(
            child: Text('Connecting to Firebase'),
          ),
        );
      },);
  }
}