import 'package:flutter/material.dart';
import 'package:syboard/models/user_obj.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/views/buy_history.dart';
import 'package:provider/provider.dart';
import 'package:syboard/views/sell_history.dart';

class BuySellHistory extends StatefulWidget {
  const BuySellHistory({Key? key}) : super(key: key);

  @override
  _BuySellHistoryState createState() => _BuySellHistoryState();
}

class _BuySellHistoryState extends State<BuySellHistory> {


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserObj?>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          titleTextStyle: kHeadingTextStyleWhite,
          toolbarHeight: 55,
          centerTitle: true,
          title: const Text("Buy/Sell History"),
          backgroundColor: AppColors.primary,
          elevation: 0.0,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Bought"),
              Tab(text: "Sold"),
            ],
          ),
        ),
        body: TabBarView(
          children: [BuyHistory(uid: user!.uid), SellHistory(uid: user.uid)],
        ),
      ),
    );
  }
}