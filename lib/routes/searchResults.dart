import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:syboard/services/service.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/models/product.dart';
import 'package:syboard/ui/product_preview.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key, this.analytics, this.observer}) : super(key: key);
  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  State<SearchResult> createState() => _SearchResult();
}

class _SearchResult extends State<SearchResult> {

  Service db = Service();
  static List<Product> searchedProducts = [];
  String searchedItem; //Submitted item to search
  
  getSearchedProduct() async {
    setState((){
      searchedProducts = await db.getSearchResults(searchedItem);
    });
  }
  
  getFirstSearchedProduct() async {
    searchedProducts = await db.getSearchResults('u');
  }

  @override
  void initState() {
    super.initState();
    getFirstSearchedProduct();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black54,
                size: 28,
              )),
          const SizedBox(width: 8)
        ],
        title: Row(
          children: [
            const SizedBox(width: 8),
            SizedBox(
                width: 38,
                height: 48,
                child: Image.asset('lib/images/logo_small.png')),
            const SizedBox(width: 8),
            Text(
              'Syboard',
              style: kHeadingTextStyle,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Search Result",
              style: kTextTitle,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: Dimen.regularPadding,
                child: Row(
                  children: List.generate(
                      searchedProducts.length,
                      (index) => Row(children: [
                            productPreview(searchedProducts[index]),
                            const SizedBox(width: 8)
                          ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
