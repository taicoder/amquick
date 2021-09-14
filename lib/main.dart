import 'package:flutter/services.dart';

import 'all_export.dart';
import 'ui/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.APP_NAME,
      initialRoute: '/',
      theme: ThemeData(
        fontFamily: "Quicksand",
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: ThemeConfig.textColor,
            fontSize: ThemeConfig.defaultSize,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          // selectionColor: Colors.amber,
          // selectionHandleColor: darkPrimarySwatchColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // routes:{
      //   '/': (context) => Introduction(),
      //   '/login': (context) => const Login(),
      // },
      getPages: [
        GetPage(name: "/", page: () => Introduction()),
        GetPage(name: "/login", page: () => const Login()),
        GetPage(name: "/home", page: () => const Home()),
        GetPage(name: "/index", page: () => const Index()),
        GetPage(name: "/account", page: () => const Account()),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  static const String title = "Asset Management Quick";

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        titleWidget: Text(
          title,
          style:
              TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 20.0),
        ),
        bodyWidget: Text(
          "Tra cứu nhanh thông tin tài sản bằng QR Code",
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
        image: Center(
          child: Lottie.asset("assets/animations/first.json"),
        ),
        decoration: ThemeConfig.pageDecoration,
      ),
      PageViewModel(
        titleWidget: Text(
          title,
          style:
              TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 20.0),
        ),
        bodyWidget: Text(
          "Kiểm kê tài sản nhanh chóng, trực quan hóa",
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
        image: Center(
          child: Lottie.asset("assets/animations/second.json"),
        ),
        decoration: ThemeConfig.pageDecoration,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    //  Navigator.pop(context);
    // Navigator.pushNamed(context, "/login");
    //  Get.offAllNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: ThemeConfig.boxDecoration,
        child: SafeArea(
          child: IntroductionScreen(
            pages: getPages(),
            onDone: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/login");
              // Get.toNamed("/login");
            },
            onSkip: () {},
            globalBackgroundColor: const Color(0xFF11249F),
            showSkipButton: false,
            showDoneButton: true,
            showNextButton: false,
            color: Colors.white.withOpacity(0.5),
            skip: const Icon(Icons.skip_next),
            next: const Icon(Icons.next_plan),
            done:
                const Text("OK", style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Colors.white.withOpacity(0.5),
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          ),
        ),
      ),
    );
  }
}
