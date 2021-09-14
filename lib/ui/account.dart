import 'package:amquick/all_export.dart';
import 'package:flutter/cupertino.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: logicalHeight / 4.5,
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
                    child: Text(""),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10), //10
                      height: 100, //140
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 6 * 0.8, //8
                        ),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/1.jpg"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Nguyễn Văn Tài",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ThemeConfig.headerSize,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "0382584635",
                style: TextStyle(
                  fontSize: ThemeConfig.headerSize,
                  letterSpacing: 2,
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            buildNotificationOptionRow("Bật thông báo", true),
            Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.info),
              title: Text(
                "Đổi thông tin",
                style: TextStyle(
                  fontSize: ThemeConfig.titleSize,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.change_circle_rounded),
              title: Text(
                "Đổi mật khẩu",
                style: TextStyle(
                  fontSize: ThemeConfig.titleSize,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 18,
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onTap: () {},
              leading: Icon(Icons.logout),
              title: Text(
                "Đăng xuất",
                style: TextStyle(
                  fontSize: ThemeConfig.titleSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Row buildNotificationOptionRow(String title, bool isActive) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: ThemeConfig.titleSize,
          ),
        ),
      ),
      Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: ThemeConfig.blueColor,
            value: true,
            onChanged: (bool val) {},
          ))
    ],
  );
}

GestureDetector buildAccountOptionRow(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Option 1"),
                  Text("Option 2"),
                  Text("Option 3"),
                ],
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close")),
              ],
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}
