import 'dart:math';

import 'package:amquick/all_export.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var _pageController = PageController();
  var count = 0;
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    const Home(),
    Asset(),
    const Message(),
    const Account(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeConfig.backgroundColor,
      body: PageView(
        children: screens,
        onPageChanged: (index) {
          setState(() {
            currentTab = index;
          });
        },
        controller: _pageController,
      ),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 5),
        child: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            backgroundColor: ThemeConfig.blueColor,
            onPressed: () async {
             await scanQRController.scanQR(context);
              setState(() {
                // count++;
              });
            },
            child: const Icon(
              Icons.qr_code,
            ),
            elevation: 5.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 20,
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                        _pageController.animateToPage(0,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.linear);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? ThemeConfig.blueColor
                              : Colors.grey,
                        ),
                        Text(
                          'Trang chủ',
                          style: TextStyle(
                            color: currentTab == 0
                                ? ThemeConfig.blueColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: ()  {
                      assetController.getAll();
                     // assetController.getAssetFromCategorie("");
                      setState(() {
                        currentTab = 1;
                        _pageController.animateToPage(1,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.linear);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.assessment,
                          color: currentTab == 1
                              ? ThemeConfig.blueColor
                              : Colors.grey,
                        ),
                        Text(
                          'Tài sản',
                          style: TextStyle(
                            color: currentTab == 1
                                ? ThemeConfig.blueColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Right Tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                   //   Get.to(Message());
                      setState(() {

                        currentTab = 2;
                        count = 0;
                        _pageController.animateToPage(2,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.linear);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.bar_chart,
                          color: currentTab == 2
                              ? ThemeConfig.blueColor
                              : Colors.grey,
                        ),
                        Text(
                          'Báo cáo',
                          style: TextStyle(
                            color: currentTab == 2
                                ? ThemeConfig.blueColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {

                        currentTab = 3;
                        _pageController.animateToPage(3,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.linear);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: currentTab == 3
                              ? ThemeConfig.blueColor
                              : Colors.grey,
                        ),
                        Text(
                          'Cá nhân',
                          style: TextStyle(
                            color: currentTab == 3
                                ? ThemeConfig.blueColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
