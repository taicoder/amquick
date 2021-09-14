import "package:amquick/all_export.dart";
import 'package:amquick/MyClippers/clipPath.dart';
import 'package:amquick/models/product.dart';
import 'package:flutter/material.dart';
import 'package:amquick/constants.dart';

import 'categorries.dart';
import 'item_card.dart';

class Asset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipPathAndSearch(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Loại tài sản",
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget ClipPathAndSearch() {
  return ClipPath(
    clipper: MyClipper(),
    child: Container(
      height: logicalHeight / 4,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF3383CD),
            Color(0xFF11249F),
          ],
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/virus.png"),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset("assets/animations/asset.json",
                  width: 100, height: 100),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    '2022',
                    style: TextStyle(fontSize: ThemeConfig.defaultSize),
                  ),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: ThemeConfig.blueColor,
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
            width: 200,
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ThemeConfig.whiteColor,
                hintText: "Tìm kiếm",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                isDense: true, // important line
                contentPadding: const EdgeInsets.fromLTRB(
                    20, 10, 20, 10), // control your hints text size
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}