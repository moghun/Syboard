import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syboard/models/user_obj.dart';
import 'package:syboard/services/auth.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/styles.dart';

class AccountDeletePP extends StatefulWidget {
  const AccountDeletePP({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountDeletePP> createState() => _AccountDeletePPState();
}

class _AccountDeletePPState extends State<AccountDeletePP> {
  String pass = "";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObj?>(context, listen: false);
    return SafeArea(
      child: Material(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           SizedBox(height: 20,),
          
          Row(
            children: [
              const Text(
                  "Please confirm your identity by providing your password"),
              const SizedBox(height: 10),
              TextField(
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (value) {
                    pass = value;
                  },
                  decoration: const InputDecoration(hintText: "Your Password"))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () async {
              if(pass != ""){
                
              }
              await AuthService().deleteAccount(user!.uid);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Delete Account',
                style: kButtonDarkTextStyle,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
          ),
        ],
      )),
    );
  }
}
