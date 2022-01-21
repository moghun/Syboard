import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:syboard/routes/search_results.dart';
import 'package:syboard/services/service.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/models/product.dart';
import 'package:syboard/models/cart_obj.dart';
import 'package:syboard/ui/product_preview.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syboard/models/order.dart';
import 'package:syboard/views/comment_card.dart';

class ProductView extends StatefulWidget {
  const ProductView(
      {Key? key, this.analytics, this.observer, required this.product})
      : super(key: key);
  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  final Product product;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  //ProductPreview
  Future<List<Order>> getComments() async {
    List<Order> orders = <Order>[];
    var productRef = Service.productCollection.doc(widget.product.pid);
    var o = await Service.ordersCollection
        .where("product", isEqualTo: productRef)
        .where("commentApproved", isEqualTo: true)
        .get();
    for (var element in o.docs) {
      orders.add(Order(
        //oid: element.id,
        //reviewed: element.get("reviewed"),
        url: widget.product.imgURL,
        productName: widget.product.productName,
        pid: widget.product.pid,
        price: widget.product.price,
        purchaseDate: element.get("purchaseDate"),
        amount: element.get("amount"),
        orderID: element.id,
        comment: element.get("comment"),
        isCommented: element.get("isCommented"),
        isRated: element.get("isRated"),
        rating: element.get("rating"),
        commentApproved: element.get("commentApproved"),
      ));
    }
    return orders;
  }

  Service db = Service();
  late SharedPreferences prefs;
  late bool favorite;

  Future getPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  handleFavorites(String pid) {
    if (prefs.getStringList("favorites") == null) {
      print("created");
      prefs.setStringList("favorites", [pid]);
    } else if (prefs.getStringList("favorites")!.contains(pid)) {
      print("deleted");
      var temp = prefs.getStringList("favorites")!;
      temp.remove(pid);
      prefs.setStringList("favorites", temp);
    } else {
      print("added");
      var temp = prefs.getStringList("favorites")!;
      temp.add(pid);
      prefs.setStringList("favorites", temp);
    }
  }

  isFavorite(String pid) async {
    if (prefs.getStringList("favorites") == null) {
      favorite = false;
    } else if (prefs.getStringList("favorites")!.contains(pid)) {
      favorite = true;
    } else {
      favorite = false;
    }
  }

  @override
  void initState() {
    super.initState();
    getPrefs().then((value) {
      isFavorite(widget.product.pid);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
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
        body: Column(
          children: [
            SingleChildScrollView(
                child: Column(children: [
              SafeArea(
                child: Center(
                  child: InteractiveViewer(
                    alignPanAxis: true,
                    panEnabled: false,
                    minScale: 1,
                    maxScale: 3,
                    child: Image.network(
                      widget.product.imgURL,
                      width: MediaQuery.of(context).size.width * 1.6,
                      height: MediaQuery.of(context).size.height / 2.6,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.product.productName.toString(),
                          style: kHeadingTextStyle,
                        ),
                        Spacer(),
                        Icon(Icons.star, color: Colors.yellow.shade700),
                        Text(widget.product.rating.toStringAsFixed(1))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Seller:",
                          style: kTextTitleSmall,
                        ),
                        TextButton(
                            onPressed: () {
                              print("Seller Page");
                            },
                            child: Text(
                              widget.product.seller.toString(),
                            )),
                      ],
                    ),
                    Text(
                      "Description",
                      style: kTextTitle,
                    ),
                    Text(
                      widget.product.description.toString(),
                      style: kTextTitleSmall,
                    ),
                    Text(
                      "Comments",
                      style: kTextTitle,
                    ),
                    FutureBuilder(
                        future: getComments(),
                        builder: (context, AsyncSnapshot asyncSnapshot) {
                          if (!asyncSnapshot.hasData)
                            return const Text("Loading Comments");
                          List<Order> orders = asyncSnapshot.data;
                          if (orders.isEmpty) {
                            return const Center(
                                child: Text("No Comment has been made"));
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  child: Column(
                                children: [
                                  CommentCard(order: orders[index]),
                                ],
                              ));
                            },
                          );
                        }),
                  ],
                ),
              ),
            ])),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Row(
                children: [
                  Text((() {
                    if (widget.product.onSale == true) {
                      return widget.product.oldPrice.toString() + "TL";
                    }
                    return "";
                  })(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.7,
                          decoration: TextDecoration.lineThrough)),
                  Text(
                    " " + widget.product.price.toString() + "TL",
                    style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.7),
                  ),
                  Spacer(),
                  IconButton(
                    splashRadius: 30,
                    iconSize: 27,
                    icon: Icon(
                      favorite ? Icons.favorite : Icons.favorite_border,
                      color: favorite ? Colors.red : Colors.grey,
                      size: 27,
                    ),
                    onPressed: () {
                      handleFavorites(widget.product.pid);
                      setState(() {
                        favorite = favorite ? false : true;
                      });
                    },
                  ),
                  OutlinedButton(
                    onPressed: () {
                      print(widget.product.onSale);
                      CartObj.addItem(widget.product.pid);
                      print("Add to Cart");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Add To Cart',
                        style: kButtonDarkTextStyle,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
