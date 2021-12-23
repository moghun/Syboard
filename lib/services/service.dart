import 'package:cloud_firestore/cloud_firestore.dart';

class service
{
  final CollectionReference productCollection = FirebaseFirestore.instance.collection('products');

  Future addProduct(String productName,double rating, String seller,double price,bool onSale,String description,String imgURL,double? oldPrice ) async
  {
    productCollection.doc().set({
      'productName': productName,
      'rating': rating,
      'seller': seller,
      'price': price,
      'onSale':bool,
      'description':description,
      'imgURL':imgURL,
      'oldPrice':oldPrice
    })
    .then((value) => print('Product added'))
    .catchError((error) => print('Error: ${error.toString()}'));
  }
}