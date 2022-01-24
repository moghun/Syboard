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
  List<Product> categoryItems = [];
  TextEditingController searchTextController = TextEditingController();

  String dropdownvalue = 'Computer';
  bool onSaleSelected = false;

  // List of items in our dropdown menu
  var categories = ["Computer", "Components", "Peripherals", "Consoles"];

  getSearchedProduct() async {
    var result = await db.getSearchResults(widget.searchQuery);
    setState(() {
      searchedProducts = result;
      categoryItems = result;
      onSaleSelected = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getSearchedProduct();
  }

  sortByName() {
    categoryItems.sort((a, b) => (a.productName).compareTo(b.productName));
    setState(() {
      categoryItems = categoryItems;
    });
  }

  sortPriceAsc() {
    categoryItems.sort((a, b) => (a.price) < (b.price) ? -1 : 1);
    setState(() {
      categoryItems = categoryItems;
    });
  }

  sortPriceDesc() {
    categoryItems.sort((a, b) => (a.price) < (b.price) ? 1 : -1);
    setState(() {
      categoryItems = categoryItems;
    });
  }

  filterByCategory(String? category) {
    List<Product> catProducts = [];
    searchedProducts.forEach((item) => {
          if (item.category == category) {catProducts.add(item)}
        });
    setState(() {
      categoryItems = catProducts;
      onSaleSelected = false;
    });
  }

  filterOnSale() {
    if (onSaleSelected) {
      List<Product> catProducts = [];
      categoryItems.forEach((item) => {
            if (item.onSale == true) {catProducts.add(item)},
          });
      setState(() {
        categoryItems = catProducts;
      });
    } else {
      setState(() {
        categoryItems = searchedProducts;
        dropdownvalue = "Computer";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results", textAlign: TextAlign.center,),
        
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
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                    onPressed: () => {sortByName()}, child: Text("By Name")),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                    onPressed: () => {sortPriceAsc()},
                    child: Text("Price asc")),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                    onPressed: () => {sortPriceDesc()},
                    child: Text("Price des")),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                    onPressed: () => {
                          setState(() {
                            onSaleSelected = !onSaleSelected;
                          }),
                          filterOnSale()
                        },
                    child: Text(onSaleSelected ? "All" : "On Sale")),
              ],
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Filter by category",
                  style: kTextTitleSmall,
                ),
                SizedBox(
                  width: 20,
                ),
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: categories.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                    filterByCategory(dropdownvalue);
                  },
                ),
              ],
            ),
            SizedBox(height:15),
             Text(
              "Search Results",
              style: kTextTitle,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: Dimen.regularPadding,
                child: Column(
                    children: categoryItems.length > 0
                        ? List.generate(
                            categoryItems.length,
                            (index) => Column(children: [
                                  productPreview(categoryItems[index], context),
                                  SizedBox(
                                    height: 10,
                                  )
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
