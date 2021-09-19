import 'package:amquick/all_export.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Lottie.asset("assets/animations/login.json",
                            width: 150, height: 150),
                        ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              '2022',
                              style:
                                  TextStyle(fontSize: ThemeConfig.defaultSize),
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: ThemeConfig.blueColor,
                            shape: const CircleBorder(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                //  "Tài sản"
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 3, bottom: 0, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() => Text(
                      scanQRController.qrCode,
                      style: TextStyle(
                        color: ThemeConfig.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: ThemeConfig.titleSize,
                      ),
                    )),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ThemeConfig.whiteColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 10.0,
                          percent: 1,
                          animation: true,
                          animationDuration: 1200,
                          header: new Text("Năm 2021"),
                          center: Text("321"),
                          progressColor: ThemeConfig.kLightColor,
                        ),
                        const SizedBox(
                          width: 70,
                          child: Text(
                            "Giảm\n25%",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 10.0,
                          percent: 1,
                          animation: true,
                          animationDuration: 1200,
                          header: const Text(
                            "Năm 2022",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          center: const Text(
                            "321",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          progressColor: ThemeConfig.kCyanColor,
                        ),
                      ],
                    ),
                  ),
                ),
                // Loại tài sản năm 2022"
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, top: 10, bottom: 0, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Loại tài sản năm 2022",
                      style: TextStyle(
                        color: ThemeConfig.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: ThemeConfig.titleSize,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ThemeConfig.whiteColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Máy tính",
                                  style: TextStyle(
                                      fontSize: ThemeConfig.defaultSize)),
                              Text("231"),
                            ],
                          ),
                        ),
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 32,
                          lineHeight: 17.0,
                          percent: 0.5,
                          center: const Text(
                            "50.0%",
                          ),
                          backgroundColor: Colors.grey.withOpacity(0.6),
                          progressColor: ThemeConfig.blueColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Máy in",
                                  style: TextStyle(
                                      fontSize: ThemeConfig.defaultSize)),
                              Text("231",
                                  style: TextStyle(
                                      fontSize: ThemeConfig.defaultSize)),
                            ],
                          ),
                        ),
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 30,
                          lineHeight: 17.0,
                          percent: 0.2,
                          center: const Text(
                            "20%",
                          ),
                          backgroundColor: Colors.grey.withOpacity(0.6),
                          progressColor: ThemeConfig.blueColor,
                        ),
                      ],
                    ),
                  ),
                ),
                //  "TÀI SẢN THANH LÝ NĂM 2021",
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 10, bottom: 0, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tài sản đã thanh lý năm 2021",
                      style: TextStyle(
                        color: ThemeConfig.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: ThemeConfig.titleSize,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ThemeConfig.whiteColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 10.0,
                          percent: 1,
                          animation: true,
                          animationDuration: 1200,
                          center: const Text(
                            "321",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          progressColor: ThemeConfig.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
