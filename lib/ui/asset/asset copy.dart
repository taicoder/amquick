import 'package:amquick/all_export.dart';

class Asset extends StatelessWidget {
  const Asset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPathAndSearch(),
            getCategoryList(),
            Container(
              height: 30,
              child: getButtonCategoryList(10),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
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

Widget getCategoryList() {
  return const Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Text(
        "Loại tài sản",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

ListView getButtonCategoryList(int n) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: List.generate(
      n,
      (i) => Padding(
        padding: EdgeInsets.only(left: 15),
        child: OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide.lerp(
                BorderSide(
                  style: BorderStyle.solid,
                  color: ThemeConfig.blueColor,
                  width: 1.5,
                ),
                BorderSide(
                  style: BorderStyle.solid,
                  color: ThemeConfig.blueColor,
                  width: 1.5,
                ),
                1,
              ),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
            overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.pressed)) {
                return ThemeConfig.blueColor;
              }
              return Colors.transparent;
            }),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return Colors.white;
            }),
          ),
          child: Text(
            "$i",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
