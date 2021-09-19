import 'dart:math';
import 'package:amquick/all_export.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final TaiSanModel taiSanModel;
  // final Function press;
  const ItemCard({
    Key? key,
    required this.taiSanModel,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 5),
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
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
                    taiSanModel.ten,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ThemeConfig.headerSize,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "("+taiSanModel.loaits!.ten+")",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ThemeConfig.titleSize,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "Giá: "+convertVND(taiSanModel.gia)+" VNĐ",
                        style: TextStyle(
                          fontSize: ThemeConfig.titleSize,
                        ),
                      ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "Ngày SD: 10/01/2022",
                          style: TextStyle(
                            fontSize: ThemeConfig.titleSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Text("Mô tả:",
                      style: TextStyle(fontSize: ThemeConfig.headerSize,),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Text("[Chưa có thông tin]",
                        style: TextStyle(fontSize: ThemeConfig.titleSize),
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                      ),
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
