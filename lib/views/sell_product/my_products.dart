import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syboard/models/user_obj.dart';
import 'package:syboard/routes/search_results.dart';
import 'package:syboard/services/service.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/models/product.dart';
import 'package:syboard/ui/edit_product_preview.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key, this.analytics, this.observer}) : super(key: key);
  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  TextEditingController searchTextController = TextEditingController();

  Future<List<Product>> getAProducts() async {
    Service db = Service();
    var sellerRef =
        Service.userCollection.doc(Provider.of<UserObj?>(context)!.uid);
    var productsDocs =
        (await db.productCollection.where("seller", isEqualTo: sellerRef).get())
            .docs;
    List<Product> productsList = <Product>[];
    for (var i = 0; i < productsDocs.length; i++) {
      var currentProductDoc = productsDocs[i];
      DocumentReference sellerRef = currentProductDoc.get("seller");
      String sellerName = (await sellerRef.get()).get("sellerName");
      var currentProduct = Product(
          pid: currentProductDoc.id,
          imgURL: currentProductDoc["imgURL"],
          productName: currentProductDoc.get("productName"),
          rating: currentProductDoc.get("rating"),
          price: currentProductDoc.get("price"),
          seller: sellerName,
          description: currentProductDoc.get("description"),
          category: currentProductDoc["category"],
          tag: currentProductDoc["tag"],
          onSale: currentProductDoc["onSale"],
          stocks: currentProductDoc["stocks"],
          oldPrice: currentProductDoc["oldPrice"] ?? 0);

      productsList.add(currentProduct);
    }
    return productsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAProducts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading..");
          } else if (snapshot.data.isEmpty) {
            return const Center(
                child:
                    Text("You are not selling any products. Try adding some!"));
          }
          List<Product> allProducts = snapshot.data;
          return Scaffold(
            body: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: Dimen.regularPadding,
                    child: Row(
                      children: List.generate(
                          allProducts.length,
                          (index) => Row(children: [
                                editProductPreview(allProducts[index], context,
                                    () {
                                  setState(() {});
                                }),
                                const SizedBox(width: 8)
                              ])),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
