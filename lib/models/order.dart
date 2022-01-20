import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String orderID;
  String url;
  String productName;
  String pid;
  num price;
  num amount;
  Timestamp purchaseDate;

  Order(
      {required this.orderID,
      required this.url,
      required this.productName,
      required this.pid,
      required this.price,
      required this.amount,
      required this.purchaseDate});
}
