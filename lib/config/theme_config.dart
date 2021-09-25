import '../all_export.dart';
import '../utils.dart';

class ThemeConfig {
  static const Color backgroundColor = Color(0xFFF5FAFE);
  static const Color textColor = Color(0xFF243d44);
  static const Color lightGrey = Color(0xfff3f3f4);

  static Color primaryColor = Colors.redAccent;
  static const Color secondColor =  Color(0xff6adca5);

  static const Color redColor =  Color(0xFFde0e16);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  static double borderRadius = 10;

  static double get headerSize => getSize(20);

  static double get titleSize => getSize(18);

  static double get defaultSize => getSize(16);
  static double get smallSize => getSize(14);

  static const Color blueColor =  Color(0xFF3383CD);

  static const kLightPinkColor = Color(0xffF3BBEC);
  static const kYellowColor = Color(0xffF3AA26);
  static const kCyanColor = Color(0xff0eaeb4);
  static const kPurpleColor = Color(0xff533DC6);
  static const kPrimaryColor = Color(0xff39439f);
  static const kBackgroundColor = Color(0xffF3F3F3);
  static const kLightColor = Color(0xffc4bbcc);

  // static const boxDecoration =
  // BoxDecoration(
  //   gradient: LinearGradient(
  //     begin: Alignment.topCenter,
  //     end: Alignment.bottomCenter,
  //     stops: [0.1, 0.4, 0.7, 0.9],
  //     colors: [
  //       Color(0xFF3594DD),
  //       Color(0xFF4563DB),
  //       Color(0xFF5036D5),
  //       Color(0xFF5B16D0),
  //     ],
  //   ),
  // );

  static const pageDecoration = PageDecoration(
    boxDecoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF3383CD),
          Color(0xFF11249F),
        ],
      ),
    ),
  );

  static const boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFF3383CD),
        Color(0xFF11249F),
      ],
    ),
  );
}
