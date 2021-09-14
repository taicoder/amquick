import 'package:amquick/all_export.dart';
import 'package:amquick/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  // final Function press;
  const ItemCard({
    Key? key,
    required this.product,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 5),
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              child: Image.asset(
                "assets/images/3.jpg",
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Học sinh hơn n 50 tỉn 50 tỉn 50 tỉ 50 tỉ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FittedBox(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Giá: 200.000 VNĐ",
                          style: TextStyle(
                            fontSize: ThemeConfig.smallSize,
                          ),
                        ),
                        Text(
                          "Ngày SD: 10/01/2022",
                          style: TextStyle(
                            fontSize: ThemeConfig.smallSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
