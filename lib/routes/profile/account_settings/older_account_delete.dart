import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syboard/services/auth.dart';

class AccountSettingsDelete extends StatefulWidget {
  const AccountSettingsDelete({Key? key}) : super(key: key);

  @override
  State<AccountSettingsDelete> createState() => _AccountSettingsDeleteState();
}

class _AccountSettingsDeleteState extends State<AccountSettingsDelete> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
    return FutureBuilder(
        future: DBService.hasProvider(Provider.of<User?>(context)!.uid),
        builder: (context, AsyncSnapshot hasProvider) {
          return OutlinedButton(
            onPressed: () async {
              if (hasProvider.data) {
                showDialog(
                    context: context,
                    builder: (context2) => AlertDialog(
                          title: const Text("Confirm Deletion"),
                          content: const Text(
                              "Are you absolutely 100% sure about deleting your account?"),
                          actions: [
                            TextButton(
                              child: const Text("Yes, I am Sure!"),
                              onPressed: () async {
                                Navigator.of(context).pop();
                                Provider.of<BottomNav>(context, listen: false)
                                    .switchTo(0);
                                Navigator.of(context).pop();
                                await _auth.deleteAccount(
                                    null, hasProvider.data);
                                await DBService.deleteAccount(uid);
                                await _auth.signOut();
                              },
                            )
                          ],
                        ));
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context2) {
                      String pass = "";
                      return AlertDialog(
                        title: const Text("Confirm Action"),
                        content: SizedBox(
                          height: 100,
                          child: Column(
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
                                  decoration: const InputDecoration(
                                      hintText: "Your Password"))
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (await _auth.deleteAccount(
                                      pass, hasProvider.data) ==
                                  null) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: const Text(
                                              "Account Deletion Error"),
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
                                          title: const Text("Account Deleted"),
                                          content: const Text(
                                              "All of your data was cleared from the system!"),
                                          actions: [
                                            TextButton(
                                              child: const Text("Okay"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ]);
                                    });
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.notification),
                            ),
                          ),
                        ],
                      );
                    });
              }
            },
            child: Padding(
              padding: Dimen.smallPadding,
              child: Text(
                'Delete Account',
                style: kButtonDarkTextStyle,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.notification,
            ),
          );
        });
  }
}
