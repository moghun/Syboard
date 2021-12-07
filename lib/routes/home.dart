import 'package:flutter/material.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/models/product.dart';
import 'package:syboard/ui/product_preview.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {




  //ProductPreview
  static final _productPreviewList = <Product>[
    Product(
        imgURL:
        "https://icons.iconarchive.com/icons/femfoyou/angry-birds/256/angry-bird-icon.png",
        productName: "AngryBirds",
        rating: 3.8,
        price: 25.99,
        seller: "Seller1"),
    Product(
        imgURL:
        "https://icons.iconarchive.com/icons/3xhumed/mega-games-pack-40/128/Mafia-2-3-icon.png",
        productName: "Mafia2",
        rating: 3.9,
        price: 119.99,
        seller: "Seller2"),
    Product(
        imgURL:
        "https://icons.iconarchive.com/icons/3xhumed/mega-games-pack-34/128/Max-Payne-3-2-icon.png",
        productName: "Max Payne 3",
        rating: 4.4,
        price: 124.99,
        seller: "Seller1"),
    Product(
        imgURL:
        "https://icons.iconarchive.com/icons/3xhumed/mega-games-pack-31/128/Left4Dead-2-2-icon.png",
        productName: "Left 4 Dead 2",
        rating: 4.5,
        price: 12.99,
        seller: "Seller2"),
    Product(
        imgURL:
        "https://icons.iconarchive.com/icons/3xhumed/mega-games-pack-34/128/GTA-IV-Lost-and-Damned-6-icon.png",
        productName: "GTA IV",
        rating: 4.7,
        price: 179.99,
        seller: "Seller1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Expanded(child: TextFormField()),
              IconButton(onPressed: () {}, icon: Icon(Icons.search))
            ]),


            Text(
              "Promotions",
              style: kHeadingTextStyle,
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
                        SizedBox(width: 8)
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
