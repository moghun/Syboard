import 'package:flutter/material.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/styles.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key, required this.sum}) : super(key: key);
  final double sum;

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(child: Text("sa")),
                Container(child: Text("as"))
              ],
            ),
          ),
          Column(
            children: [
              const Divider(thickness: 1, height: 1, color: Colors.black12),
              SizedBox(
                height: 64,
                child: Material(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
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
                                '${widget.sum} USD',
                                style: kTextTitleMedium,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                              child: const Text('Purchase'),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: AppColors.primary,
                                onSurface: Colors.grey,
                              ),
                              onPressed: () {
                                ;
                              },
                            ),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
