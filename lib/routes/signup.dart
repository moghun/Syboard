import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/utils/styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:syboard/services/auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:syboard/utils/analytics-utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class SignUp extends StatefulWidget {

  const SignUp({Key? key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

  String mail = "";
  String initialPass = "";
  String finalPass = "";
  String errMsg = "";

  void setErrorMessage(String e){
    setState(() {
      errMsg = e;
    });
  }

  Future<void> signUp() async {
    try {
      await authService.signUpUser(mail, initialPass);
      FirebaseAnalytics().logEvent(name: "successfulSignup");
      Navigator.pushReplacementNamed(context, "/");
    } on FirebaseAuthException catch (e) {
      if(e.code == 'email-already-in-use'){
        setErrorMessage('User with this email already exists');
      } else if(e.code == 'weak-password'){
        setErrorMessage('Please choose a stronger password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics().setCurrentScreen(screenName: "signupScreen");
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: kAppBarTitleTextStyle,
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          maintainBottomViewPadding: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 64,
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
              const SizedBox(
                height: 36,
              ),
              Text(errMsg, style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),),
              Padding(
                padding: Dimen.regularPadding,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'E-mail',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.primary,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  prefixIcon: Icon(Icons.email),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null) {
                                    return 'E-mail field cannot be empty';
                                  } else {
                                    String trimmedValue = value.trim();
                                    if (trimmedValue.isEmpty) {
                                      return 'E-mail field cannot be empty';
                                    }
                                    if (!EmailValidator.validate(
                                        trimmedValue)) {
                                      return 'Please enter a valid email';
                                    }
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  if (value != null) mail = value;
                                }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              validator: (value) {
                                initialPass = value!.trim();
                                if (value == null) {
                                  return 'Password field cannot be empty';
                                } else {
                                  String trimmedValue = value.trim();
                                  if (trimmedValue.isEmpty) {
                                    return 'Password field cannot be empty';
                                  }
                                  if (trimmedValue.length < 8) {
                                    return 'Password must be at least 8 characters long';
                                  }
                                }
                                return null;
                              },
                              onSaved: (value) {
                                if (value != null) {
                                  initialPass = value;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Confirm Password',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              validator: (value) {
                                if (value == null) {
                                  return 'Password field cannot be empty';
                                } else {
                                  String trimmedValue = value.trim();
                                  if (trimmedValue.isEmpty) {
                                    return 'Password field cannot be empty';
                                  }
                                  if (trimmedValue.length < 8) {
                                    return 'Password must be at least 8 characters long';
                                  }
                                  if (value != initialPass) {
                                    return 'Passwords are not matching';
                                  }
                                }
                                return null;
                              },
                              onSaved: (value) {
                                if (value != null) {
                                  finalPass = value;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  signUp();
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  await prefs.setBool('hasProvider', false);
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  'Sign Up',
                                  style: kButtonDarkTextStyle,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SignInButton(
                            Buttons.Google,
                            text: 'Sign Up with Google',
                            onPressed: () async {
                              authService.googleSignIn();
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('hasProvider', true);
                            },
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(context, "/login");
                            },
                            child: const Text(
                              "If you have account? Log In Here",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
