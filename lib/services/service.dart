import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syboard/models/product.dart';

class Service {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  static final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  static Future addUser(String uid) async {
    userCollection.doc(uid).set({'notificationIDs': [1]});
  }

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
      // Map<String, dynamic> productMap = jsonDecode(doc.data().toString());
      // Product product = Product.fromJson(productMap);
      // list.add(product);
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
}
