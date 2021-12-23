import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:syboard/services/auth.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:syboard/utils/analytics-utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String pass = "";
  String errMsg = "";

  AuthService authService = AuthService();

  void setErrorMessage(String e){
    setState(() {
      errMsg = e;
    });
  }

  Future<void> loginUser() async {
    try {
      await authService.loginUser(mail, pass);
      FirebaseAnalytics().logEvent(name: "successfulLogin");
      Navigator.pushReplacementNamed(context, "/");
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      FirebaseAnalytics().logEvent(name: "failedLogin");
      if(e.code == 'user-not-found' || e.code == 'wrong-password') {
        setErrorMessage('Wrong username or password!');
      }
    }
  }

  @override
  void initState() {
    super.initState();

    authService.user.listen((user) {
      if(user == null){
        print('No user is currently signed in.');
      } else {
        print('${authService.getCurrentUser()!.name} is the current user');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setCurrentScreenUtil(analytics: widget.analytics, screenName: "loginScreen");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Log In',
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
                height: 40,
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
                                  if (!EmailValidator.validate(trimmedValue)) {
                                    return 'Please enter a valid email';
                                  }
                                }
                                return null;
                              },
                              onSaved: (value) {
                                if (value != null) {
                                  mail = value;
                                }
                              },
                            ),
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
                                  pass = value;
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
                              onPressed: () {
                                setErrorMessage(' ');
                                if (_formKey.currentState!.validate()){
                                  _formKey.currentState!.save();
                                  loginUser();
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  'Log In',
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
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SignInButton(
                                Buttons.Google,
                                text: 'Log In with Google',
                                onPressed: () async {
                                  await authService.googleSignIn();
                                  Navigator.popAndPushNamed(context, '/');
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
                              Navigator.popAndPushNamed(context, "/signup");
                            },
                            child: const Text(
                              "Don't have an account? Sign Up Here",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              authService.signInAnon();
                              Navigator.popAndPushNamed(context, "/");
                            },
                            child: const Text(
                              "Contiune without Logging In",
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
