import 'package:amquick/ui/login.dart';
import 'all_export.dart';
class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);
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
