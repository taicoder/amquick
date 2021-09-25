import 'package:amquick/all_export.dart';
import 'package:flutter/material.dart';

import 'package:amquick/constants.dart';

// We need satefull widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Obx(()=> assetController.processing==true ? Text(""): SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: assetController.listCategories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          assetController.selectedIndex = index;
          assetController.getAssetFromCategorie(assetController.listCategories[index].id.toString());
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              assetController.listCategories[index].ten,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: assetController.selectedIndex == index ? kTextColor : kTextLightColor,
                fontSize: ThemeConfig.titleSize,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: assetController.selectedIndex == index ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
