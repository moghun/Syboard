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

class Home extends StatefulWidget {
  const Home({Key? key, this.analytics, this.observer}) : super(key: key);
  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //ProductPreview
  static final _productPreviewList = <Product>[
    Product(
        imgURL:
            "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/msi/thumb/v2-84267-6_large.jpg",
        productName: "Nvidia Geforce GTX1050ti",
        rating: 5,
        price: 100.99,
        seller: "Vatan PC",
        description: "",
        onSale: false),
    Product(
        imgURL:
            "https://www.incehesap.com/resim/urun/202109/6145d6afce4703.99445409_pgnkeiolfmqhj_500.jpg",
        productName: "MSI Prestige Notebook",
        rating: 3.9,
        price: 2000.99,
        seller: "İtopya.com",
        description: "",
        onSale: false),
    Product(
        imgURL:
            "https://m.media-amazon.com/images/I/91LSF1iZUFL._AC_SL1500_.jpg",
        productName: "Gaming PC",
        rating: 4.4,
        price: 1000.99,
        seller: "Hasan Hüseyin",
        description: "",
        onSale: false),
    Product(
        imgURL: "https://static.sinerji.gen.tr/Images/MD/N8H-da-s1.jpg",
        productName: "Gaming PC",
        rating: 4.5,
        price: 12.99,
        seller: "Seller2",
        description: "",
        onSale: false),
    Product(
        imgURL:
            "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/asus/thumb/118533_large.jpg",
        productName: "Gaming Monitor",
        rating: 4.7,
        price: 179.99,
        seller: "Seller1",
        description: "",
        onSale: false),
  ];
  service DB = service();

  @override
  Widget build(BuildContext context) {
    DB.addProduct('elma',4.9,'pazarci',7,true,'golden elma','deneme',10);
    DB.addProduct('patates',4.9,'pazarci',7,false,'yerli patetes','deneme',null);
    DB.addProduct('havuc',4.9,'pazarci',7,true,'havuc','deneme',null);
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
          const SizedBox(width:8)
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
            Padding(
              padding: Dimen.regularPadding,
              child: Row(children: [
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search...",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                )),
              ]),
            ),
            Text(
              "Top Products",
              style: kTextTitle,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: Dimen.regularPadding,
                child: Row(
                  children: List.generate(
                      _productPreviewList.length,
                      (index) => Row(children: [
                            productPreview(_productPreviewList[index]),
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
