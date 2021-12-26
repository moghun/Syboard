import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:syboard/models/account_list_item.dart';
import 'package:syboard/ui/account_list_item_tile.dart';
import 'package:syboard/utils/color.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {

  static final _itemList = <AccountListItem>[
    AccountListItem(icon: const Icon(Icons.person), name: "My User Information", route: '/profile/change_name'),
    AccountListItem(icon: const Icon(Icons.insert_photo), name: "Change profile picture", route: '/'),
    AccountListItem(icon: const Icon(Icons.lock), name: "Change password", route: '/profile/change_password'),
    AccountListItem(icon: const Icon(Icons.highlight_remove), name: "Delete Account", route: '/'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text("Edit Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: List.generate(
                _itemList.length,
                (index) => Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: AccountListItemTile(_itemList[index], context),
                          ))
                    ]
                )),
        ),
      ),
    );
  }
}
