import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:syboard/services/auth.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/styles.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

  String initialPass = "";
  String finalPass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text("Change Password"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                  children: [
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
                              hintText: 'New password',
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
                              hintText: 'Confirm new password',
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
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                authService.changePassword(initialPass);
                              }
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                'Change password',
                                style: kButtonDarkTextStyle,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
