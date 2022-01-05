import 'package:flutter/material.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/views/sell_product/add_product.dart';
import 'package:syboard/views/sell_product/my_products.dart';
import 'package:syboard/views/sell_product/my_stocks.dart';

class SellProduct extends StatefulWidget {
  const SellProduct({Key? key}) : super(key: key);

  @override
  State<SellProduct> createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct>
    with TickerProviderStateMixin {
  int _currentTab = 0;

  void refreshFunc() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("deneme");
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            titleTextStyle: kAppBarTitleTextStyle,
            toolbarHeight: 55,
            centerTitle: true,
            title: const Text("Add/Increase Products"),
            backgroundColor: AppColors.primary,
            elevation: 0.0,
            bottom: TabBar(
              onTap: (value) {
                setState(() {
                  _currentTab = value;
                });
              },
              tabs: const [
                Tab(text: "My Products"),
                Tab(text: "Check Stocks"),
              ],
            ),
          ),
          // body: TabBarView(
          //   children: [
          //     MyProducts(
          //       refreshFunc: refreshFunc,
          //     ),
          //     const MyStocks()
          //   ],
          // ),
          floatingActionButton: Visibility(
            visible: _currentTab == 0,
            child: FloatingActionButton.extended(
                backgroundColor: AppColors.primary,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AddProduct(
                            refreshFunc: refreshFunc,
                          )));
                },
                label: const Text("New"),
                icon: const Icon(Icons.add)),
          )),
    );
  }
}
