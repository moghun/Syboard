import 'package:flutter/material.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/models/product.dart';

Widget productPreview(Product product) {
  return SizedBox(
      width: 150,
      child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: Dimen.regularPadding,
            child: Column(
              children: [
                IconButton(
                  iconSize: 70,
                  splashRadius: 70,
                  icon: Image.network(
                    product.imgURL,
                    height: 70,
                    width: 75,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 30,
                  child: TextButton(
                    child: Text(
                      product.productName,
                      style: kTextTitleSmall,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: TextButton(
                    child: Text(
                      product.seller,
                      style: kTextCaption,
                    ),
                    onPressed: () {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text("${product.rating}", style: kImportantText)
                  ],
                ),
                Text("\$ ${product.price}")
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            splashRadius: 30,
            iconSize: 20,
            icon: const Icon(Icons.favorite_outlined),
            color: Colors.red,
            onPressed: () {},
          ),
        ),
      ]));
}
