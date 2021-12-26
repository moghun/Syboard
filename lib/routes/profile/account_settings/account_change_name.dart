import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syboard/models/user_obj.dart';
import 'package:syboard/services/auth.dart';
import 'package:syboard/utils/color.dart';

class AccountSettingsName extends StatefulWidget {
  const AccountSettingsName({Key? key}) : super(key: key);

  @override
  _AccountSettingsNameState createState() => _AccountSettingsNameState();
}

class _AccountSettingsNameState extends State<AccountSettingsName> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material( 
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                    initialValue: Provider.of<UserObj?>(context)!.name,
                   /* decoration: InputDecoration(
                    //  fillColor: AppColors.DarkTextColor,
                      filled: true,
                      hintText: "Name",
                     // hintStyle: kButtonLightTextStyle,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),*/
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null) {
                        return "name can not be empty";
                      } else {
                        String trimmedValue = value.trim();
                        if (trimmedValue.isEmpty) {
                          return "name can not be empty";
                        }
                      }
                      return null;
                    },
                    onSaved: (value) {
                      if (value != null) {
                        name = value;
                      }
                    }),
                OutlinedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (await _auth.updateName(name) == null) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: const Text("Name Change Error"),
                                  content: const Text(
                                      "An error occurred. Please notify admins"),
                                  actions: [
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ]);
                            });
                      } else {
                        FocusScope.of(context).unfocus();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: const Text("Name Change Successful"),
                                  content: const Text("Your name has been changed"),
                                  actions: [
                                    TextButton(
                                      child: const Text("Okay"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ]);
                            });
                      }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Update Name',
                      //style: kButtonDarkTextStyle,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
