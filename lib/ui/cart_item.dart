import 'package:flutter/material.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/models/product.dart';


Widget CartItem(Product product) {
  return SizedBox(
    width: 180,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Material(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  product.imgURL,
                  height: 70,
                  width: 75,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 34,
                                width: 180,
                                child: Text(
                                  product.productName,
                                  style: kTextTitleSmall,
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(
                              child: Text(
                                product.seller,
                                style: kTextCaption,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.delete_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Material(
                                child: InkWell(
                                  child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.remove,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            const SizedBox(width:12),
                            const Text("2"),
                            const SizedBox(width:12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Material(
                                child: InkWell(
                                  child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            child: Text("\$ ${product.price}")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
