import 'package:amquick/all_export.dart';

class GlobalController extends GetxController {
  String error="";
  RxBool _processing = false.obs;
  bool get processing => _processing.value;

  @override
  void onInit() {
    super.onInit();
  }
}

final GlobalController globalController =  Get.put(GlobalController(), permanent: true);
