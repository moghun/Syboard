import 'package:flutter/material.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/utils/styles.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
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
                height: 96,
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
                height: 64,
              ),
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
                              validator: (value) {},
                              onSaved: (value) {},
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
                              validator: (value) {},
                              onSaved: (value) {},
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
                              onPressed: () {},
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
                      const SizedBox(height: 8,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(context, "/signup");
                            },
                            child: const Text(
                              "Didn't have any account? Sign Up Here",
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
