import 'package:amquick/all_export.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
    var result = await api.login(user: "0382584635", password: "123");
   // print("ok: "+globalController.error+"");
  }
}

final UserController userController =
    Get.put(UserController(), permanent: true);
