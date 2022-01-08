import 'package:flutter/material.dart';
import 'package:syboard/models/cart_obj.dart';
import 'package:syboard/services/service.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/models/product.dart';
import 'package:syboard/ui/cart_item.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Service db = Service();
  //CartItem
  List<int> _CartAmount = [];
  List<Product> _CartItemList = <Product>[];

  Future getProducts() async {
    var value = await CartObj.getItems();
    Product currentProduct;
    for (int i = 0; i < value[0].length; i++) {
      currentProduct = await getTheProduct(value[0][i]);
      _CartItemList.add(currentProduct);
      _CartAmount.add(int.parse(value[1][i]));
    }
  }

  Future<Product> getTheProduct(pid) async {
    return await db.getTheProduct(pid);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Shopping Cart',
              style: kAppBarTitleTextStyle,
              textAlign: TextAlign.left,
            ),
            const Text('  -  6 items',
                textScaleFactor: 0.8, style: TextStyle(color: Colors.black45))
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _CartItemList.length,
                itemBuilder: (context, i) {
                  return CartItem(_CartItemList[i], _CartAmount[i],
                      (String type) {
                    setState(() {
                      if(type == "add")
                      _CartAmount[i] = _CartAmount[i]+1;
                      else if (type == "remove"){
                        _CartAmount[i] = _CartAmount[i]-1;
                        if(_CartAmount[i] == 0){
                          _CartItemList.removeAt(i);
                          _CartAmount.removeAt(i);
                        }
                      }
                      else{ // delete
                        _CartItemList.removeAt(i);
                        _CartAmount.removeAt(i);
                      }
                    });
                  });
                }),
          ),
          const Divider(thickness: 1, height: 1, color: Colors.black12),
          SizedBox(
            height: 64,
            child: Material(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Total'),
                          const SizedBox(width: 8),
                          Text(
                            'USD 295',
                            style: kTextTitleMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: TextButton(
                          child: const Text('Proceed to Checkout'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: AppColors.primary,
                            onSurface: Colors.grey,
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
