import 'package:amquick/all_export.dart';
import 'package:intl/intl.dart';

class AssetController extends GetxController {
  RxBool _processing = false.obs;
  bool get processing => _processing.value;
  List<LoaiTSModel> listCategories=[];
  List<TaiSanModel> listAssets=[];
  @override
  void onInit() {
    super.onInit();
  }

  void getAll(){
    getCategories();
    getAsset();
  }

  void getCategories() async {
     var result = await api.categrories();
    // if(result){
    //   _processing.value=false;
    //    Navigator.pop(context);
    //    Navigator.pushNamed(context, "/index");
    // //  Get.toNamed("/index");
    // }else{
    //   globalController.errorToast("Kết nối máy chủ thất bại");
    //   _processing.value=false;
    // }
  }

  void getAsset() async {
    var result = await api.asset();
    // if(result){
    //   _processing.value=false;
    //    Navigator.pop(context);
    //    Navigator.pushNamed(context, "/index");
    // //  Get.toNamed("/index");
    // }else{
    //   globalController.errorToast("Kết nối máy chủ thất bại");
    //   _processing.value=false;
    // }
  }
  void getAssetFromCategorie(String id) async {
   // var result = await api.taisan();
    // if(result){
    //   _processing.value=false;
    //    Navigator.pop(context);
    //    Navigator.pushNamed(context, "/index");
    // //  Get.toNamed("/index");
    // }else{
    //   globalController.errorToast("Kết nối máy chủ thất bại");
    //   _processing.value=false;
    // }
  }

}

final AssetController assetController =
    Get.put(AssetController(), permanent: true);
