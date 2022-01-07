import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:syboard/models/product.dart';
//import 'package:syboard/routes/notifications.dart';
import 'package:syboard/models/notification_item.dart';

class Service {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  static final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  static final CollectionReference notificationCollection =
      FirebaseFirestore.instance.collection('notifications');

  static Future addUser(String uid) async {
    userCollection.doc(uid).set({
      'notificationIDs': [1]
    });
  }

  Future addProduct(
      String category,
      String name,
      num price,
      DocumentReference seller,
      String tag,
      File picture,
      num stocks,
      String description,
      bool onSale,
      num? oldPrice) async {
    var productRef = await productCollection.add({
      'productName': name,
      'rating': 0.0,
      'seller': seller,
      'price': price,
      'onSale': onSale,
      'description': description,
      'imgURL': "",
      'oldPrice': oldPrice
    });

    var ref = FirebaseStorage.instance.ref();
    String filepath =
        "/productImages/${productRef.id}${extension(picture.path)}";
    await ref.child(filepath).putFile(picture);
    String productPictureURL = await ref.child(filepath).getDownloadURL();
    await productRef.update({"imgURL": productPictureURL});
  }

  Future<List<Product>> getProducts() async {
    QuerySnapshot allProductsQuery = await productCollection.get();
    List<Product> list = [];
    allProductsQuery.docs.forEach((doc) async {
      DocumentReference sellerRef = doc["seller"];
      String sname = (await sellerRef.get()).get("sellerName") ?? "hello";
      list.add(Product(
          imgURL: doc["imgURL"],
          productName: doc["productName"],
          rating: doc["rating"],
          price: doc["price"],
          seller: sname,
          description: doc["description"],
          onSale: false));
    });
    return list;
  }
  Future<List<Product>> getSearchResults(query) async {
  List<Product> list = [];
    /*   var products = await FirebaseFirestore.instance.collection('products')
        .where('productName', isGreaterThanOrEqualTo: query,

      isLessThan: query.substring(0, query.length - 1) +
          String.fromCharCode(query.codeUnitAt(query.length - 1) + 1),

    ).get();*/
    var products =
        await FirebaseFirestore.instance.collection('products').get();

    products.docs.forEach((doc) async {
      if ((doc["productName"]).toString().contains(query)) {
        DocumentReference sellerRef = doc["seller"];
        String sname = (await sellerRef.get()).get("sellerName") ?? "hello";
        list.add(Product(
            imgURL: doc["imgURL"],
            productName: doc["productName"],
            rating: doc["rating"],
            price: doc["price"],
            seller: sname,
            description: doc["description"],
            onSale: false));
      }
    });

    return list;
  }

  FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
  void doesExist(String src, var results) {
    bool ch = false;
    for (int i = 0; i < results.length; i++) {
      if (src == results[i].identifier || src == results[i].description)
        ch = true;
    }
    if (ch == false) {
      crashlytics.setCustomKey("Product not found: ", src);
    }
  }

  pushNotifications(String userID, String message) async {
    userCollection.doc(userID).update({
      "notifications": FieldValue.arrayUnion([message]),
    });
  }

  getNotifications(String userID) async {
    var userQuery = await userCollection.get();
    List notificationIDs = [];

    userQuery.docs.forEach((doc) {
      if (userID == doc.id) {
        notificationIDs.addAll(doc["notificationIDs"]);
      }
    });

    List<NotificationItem> notifications = [];
    var notificationQuery = await notificationCollection.get();

    notificationQuery.docs.forEach((element) {
      notificationIDs.forEach((item) {
        if (item.toString() == element.id.toString()) {
          notifications.add(NotificationItem(message: element["content"]));
        }
      });
    });
    return notifications;
  }
}
