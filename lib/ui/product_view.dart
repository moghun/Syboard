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

  Service db = Service();

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
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.7,
                    child: Image.network(widget.product.imgURL)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.product.productName.toString(),
                          style: kHeadingTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ])),
          ],
        ));
  }
}



