import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syboard/models/cart_obj.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/models/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

addToCart(String pid) async {

}

Widget productPreview(Product product) {
  return SizedBox(
      width: 180,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        InkWell(
          onTap: () {
            CartObj.addItem(product.pid);
          },
          child: Material(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Image.network(
                    product.imgURL,
                    height: 70,
                    width: 75,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      height: 34,
                      width: 180,
                      child: Text(
                        product.productName,
                        style: kTextTitleSmall,
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.seller,
                      style: kTextCaption,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: product.rating.toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemSize: 12,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Text("\$ ${product.price}")),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -8,
          right: -8,
          child: IconButton(
            splashRadius: 30,
            iconSize: 20,
            icon: const Icon(Icons.favorite),
            color: Colors.red,
            onPressed: () {},
          ),
        ),
      ]));
}
