import 'package:amquick/all_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxBool _processing = false.obs;
  bool get processing => _processing.value;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  void login(BuildContext context) async {
    _processing.value=true;
    var result = await api.login(user:phoneController.text, password:passwordController.text);
    if(result){
      _processing.value=false;
      Navigator.pop(context);
      Navigator.pushNamed(context, "/index");

      //get all
      assetController.getAll();
    }else{
      globalController.errorToast("Kết nối máy chủ thất bại");
      _processing.value=false;
    }
  }
}

final UserController userController =
Get.put(UserController(), permanent: true);
