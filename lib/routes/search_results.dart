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
  SearchResult(
      {Key? key, this.analytics, this.observer, required this.searchQuery})
      : super(key: key);
  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;
  String searchQuery;

  @override
  State<SearchResult> createState() => _SearchResult();
}

class _SearchResult extends State<SearchResult> {
  Service db = Service();
  List<Product> searchedProducts = [];
  TextEditingController searchTextController = TextEditingController();

  getSearchedProduct() async {
    var result = await db.getSearchResults(widget.searchQuery);
    setState(() {
      searchedProducts = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getSearchedProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
          ],
        ),
        backgroundColor: AppColors.primary,
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Row(children: [
                Expanded(
                    child: Padding(
                        padding: Dimen.regularPadding,
                        child: TextField(
                          controller: searchTextController,
                          decoration: const InputDecoration(
                            hintText: "Search...",
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: AppColors.primary),
                            ),
                          ),
                        ))),
                IconButton(
                    onPressed: () {
                      if (searchTextController.text != "") {
                        setState(() {
                          widget.searchQuery = searchTextController.text;
                        });
                        getSearchedProduct();
                      }
                    },
                    icon: Icon(Icons.search)),
              ]),
            ),
            Text(
              "Search Results",
              style: kTextTitle,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: Dimen.regularPadding,
                child: Row(
                    children: searchedProducts.length > 0
                        ? List.generate(
                            searchedProducts.length,
                            (index) => Row(children: [
                                  productPreview(searchedProducts[index], context),
                                  const SizedBox(width: 8)
                                ]))
                        : [Text("No related product found")]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
