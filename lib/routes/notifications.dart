import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:syboard/models/notification_item.dart';
import 'package:syboard/models/user_obj.dart';
import 'package:syboard/services/service.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/ui/notification_tile.dart';

class Notifications extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  const Notifications(
      {Key? key, required this.analytics, required this.observer})
      : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

Service usersService = Service();
List<NotificationItem> allNotificationsFuture = [];
List<NotificationItem> allNotifications = [];

Future getAllNotifications(userID) async {
  allNotificationsFuture = await usersService.getNotifications(userID);
  return allNotificationsFuture;
}

class _NotificationsState extends State<Notifications> {
  Service usersService = Service();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObj?>(context);
    if (user != null) {
      getAllNotifications(user.uid).then((element) {
        setState(() {
          allNotifications = element;
        });
      });

      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Notifications"),
            backgroundColor: AppColors.primary,
            elevation: 2.0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: List.generate(
                  allNotifications.length,
                  (index) => Row(children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          child: NotificationTile(
                              allNotifications[index], context),
                        ))
                      ])),
            ),
          ),
        ),
      );
    } else {
      return const Center(child: Text("Refresh the page!"));
    }
  }
}
