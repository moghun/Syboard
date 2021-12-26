import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:syboard/models/product.dart';

class Service {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  Future addProduct(
      String productName,
      double rating,
      String seller,
      double price,
      bool onSale,
      String description,
      String imgURL,
      double? oldPrice) async {
    productCollection
        .doc()
        .set({
          'productName': productName,
          'rating': rating,
          'seller': seller,
          'price': price,
          'onSale': onSale,
          'description': description,
          'imgURL': imgURL,
          'oldPrice': oldPrice
        })
        .then((value) => print('Product added'))
        .catchError((error) => print('Error: ${error.toString()}'));
  }

  Future<List<Product>> getProducts() async {
    QuerySnapshot allProductsQuery = await productCollection.get();
    List<Product> list = [];
    allProductsQuery.docs.forEach((doc) {
      list.add(Product(
          imgURL: doc["imgURL"],
          productName: doc["productName"],
          rating: doc["rating"],
          price: doc["price"],
          seller: doc["seller"],
          description: doc["description"],
          onSale: false));
    });
    return list;
  }


  Future<List<Product>> getSearchResults(query) async {

    List<Product> list = [];

    var products = await FirebaseFirestore.instance.collection('products')
        .where('productName', isGreaterThanOrEqualTo: query,

      isLessThan: query.substring(0, query.length - 1) +
          String.fromCharCode(query.codeUnitAt(query.length - 1) + 1),

    ).get();

    products.docs.forEach((doc) => {
      list.add(Product(
      imgURL: doc["imgURL"],
      productName: doc["productName"],
      rating: doc["rating"],
      price: doc["price"],
      seller: doc["seller"],
      description: doc["description"],
      onSale: false));
    });

    return list;
  }

  FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
  void doesExist(String src, var results) {
    bool ch = false;
    for (int i = 0; i < results.length; i++) {
      if (src == results[i].identifier ||
          src == results[i].description) ch = true;
    }
    if (ch == false) {
      crashlytics.setCustomKey("Product not found: ", src);
    }
  }

}
