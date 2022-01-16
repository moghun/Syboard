import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syboard/models/user_obj.dart';
import 'package:syboard/services/auth.dart';
import 'package:syboard/services/service.dart';
import 'package:syboard/utils/dimension.dart';
import 'package:syboard/models/product.dart';
import 'package:syboard/ui/edit_product_preview.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syboard/utils/styles.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key, this.analytics, this.observer}) : super(key: key);
  final FirebaseAnalytics? analytics;
  final FirebaseAnalyticsObserver? observer;

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  TextEditingController searchTextController = TextEditingController();

  List<Product> productsOnSale = [];
  List<Product> productsSold = [];

  Future<List<Product>> getAProducts() async {
    var sellerRef =
        Service.userCollection.doc(Provider.of<UserObj?>(context)!.uid);
    var productsDocs =
        (await Service.productCollection.where("seller", isEqualTo: sellerRef).get())
            .docs;
    List<Product> productsList = <Product>[];
    for (var i = 0; i < productsDocs.length; i++) {
      var currentProductDoc = productsDocs[i];
      DocumentReference sellerRef = currentProductDoc.get("seller");
      String sellerName = (await sellerRef.get()).get("sellerName");
      var currentProduct = Product(
          pid: currentProductDoc.id,
          imgURL: currentProductDoc["imgURL"],
          productName: currentProductDoc.get("productName"),
          rating: currentProductDoc.get("rating"),
          price: currentProductDoc.get("price"),
          seller: sellerName,
          description: currentProductDoc.get("description"),
          category: currentProductDoc["category"],
          tag: currentProductDoc["tag"],
          onSale: currentProductDoc["onSale"],
          stocks: currentProductDoc["stocks"],
          oldPrice: currentProductDoc["oldPrice"] ?? 0);

      productsList.add(currentProduct);
    }
  filterProductsOnSale(productsList);

    return productsList;
  }

  // getSoldProducts() async {
  //   var sellerRef =
  //       Service.userCollection.doc(Provider.of<UserObj?>(context)!.uid);
  //   var productsDocs =
  //       (await Service.ordersCollection.where("seller", isEqualTo: sellerRef).get())
  //           .docs;
  //   List<Product> productsList = <Product>[];
  //   for (var i = 0; i < productsDocs.length; i++) {
  //     var element = productsDocs[i];
  //     print(element);
  //     DocumentReference currentProduct = element.get("product");
  //     String sellerName = (await sellerRef.get()).get("sellerName");

  //     var currentP = await Service().getTheProduct(currentProduct.id);
  //     // Product(
  //     //     pid: currentProduct.id,
  //     //     imgURL: (await currentProduct.get())["imgURL"],
  //     //     productName:(await currentProduct.get()).get("productName"),
  //     //     rating: (await currentProduct.get()).get("rating"),
  //     //     price: (await currentProduct.get()).get("price"),
  //     //     seller: sellerName,
  //     //     description: (await currentProduct.get()).get("description"),
  //     //     category: (await currentProduct.get())["category"],
  //     //     tag: (await currentProduct.get())["tag"],
  //     //     onSale: (await currentProduct.get())["onSale"],
  //     //     stocks: (await currentProduct.get())["stocks"],
  //     //     oldPrice: (await currentProduct.get())["oldPrice"] ?? 0);
    
  //     productsList.add(currentP);
  //     print(currentP);
  //   }

  //   setState(() {
  //     productsSold = productsList;
  //   });
   
  // }

  filterProductsOnSale(List<Product> pAll){
   
    List<Product> catProducts = [];
     pAll.forEach((item) => {
        if(item.onSale == true){
          catProducts.add(item)
        },

        
     });
     setState(() {
          productsOnSale = catProducts;
    });
    
     
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAProducts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading..");
          } else if (snapshot.data.isEmpty) {
            return const Center(
                child:
                    Text("You are not selling any products. Try adding some!"));
          }
          List<Product> allProducts = snapshot.data;
          return Scaffold(
            body:  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Your Current Rating' ,
                  style: kTextTitleMedium,
                    
                    ),
                  Row(
                    children: [
                        Text("5.0" ,
                  style: kTextTitleMedium,
                    
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ],
                  )
                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  children: [
                     Text('Products On Sale' ,
                  style: kTextTitle,
                    
                    ),
                    SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: Dimen.regularPadding,
                      child: Row(
                        children: List.generate(
                            productsOnSale.length,
                            (index) => Row(children: [
                                  editProductPreview(productsOnSale[index], context,
                                      () {
                                    setState(() {});
                                  }),
                                  const SizedBox(width: 8)
                                ])),
                      ),
                    ),
                   )   ,
                  ],
                ),
                SizedBox(height: 30,),

                 Column(
                  children: [
                     Text('Sold Products' ,
                  style: kTextTitle,
                    
                    ),
                    SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: Dimen.regularPadding,
                      child: Row(
                        children: List.generate(
                            productsSold.length,
                            (index) => Row(children: [
                                  editProductPreview(productsSold[index], context,
                                      () {
                                    setState(() {});
                                  }),
                                  const SizedBox(width: 8)
                                ])),
                      ),
                    ),
                   )   ,
                  ],
                ),
                
              ],
            ),
            )
          );
        });
  }
}
