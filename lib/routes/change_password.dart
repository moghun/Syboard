import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:syboard/utils/color.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

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
          Form(
            key: _formKey,
            child: Column(
                children: [
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
                ],
              ),
          ),
        ],
      ),
    );
  }
}
