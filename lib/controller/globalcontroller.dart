import 'package:amquick/all_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  String error="";
  void userSharedPreferences(UserModel user, String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user.user);
    prefs.setString('name', user.name);
    prefs.setString('token', token);
  }

  // use String value = await getValue() ?? "";
  Future<String> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString(key).toString();
    return stringValue;
  }

  void successToast(String content) {
     Get.snackbar(
      "",
      content,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ThemeConfig.blueColor.withOpacity(0.5),
      colorText: Colors.white,
    );
  }

  void errorToast(String content) {
    Get.snackbar(
      "Lỗi",
      content,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ThemeConfig.redColor.withOpacity(0.5),
    );
  }


  @override
  void onInit() {
    super.onInit();
  }
}

final GlobalController globalController =  Get.put(GlobalController(), permanent: true);
