import 'package:amquick/all_export.dart';
import 'package:flutter/services.dart';

class ScanQRController extends GetxController {
  RxBool _processing = false.obs;
  bool get processing => _processing.value;
  String scanedQrCode="";
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> scanQR(BuildContext context) async {
    _processing.value=true;
    scanedQrCode="";
    try {
      _processing.value=false;
      scanedQrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Hủy', true, ScanMode.QR);
     TaiSanModel taiSanModel = assetController.listAssets.where((x) => x.id==scanedQrCode).first;
     assetController.setUpdateFormAsset(taiSanModel);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AssetDetail()));
    } catch(e) {
      if(!e.toString().contains("-1") && !scanedQrCode.contains("-1")) {
        globalController.errorToast("Không tìm thấy dữ liệu "+scanedQrCode);
      }
    }
  }



}

final ScanQRController scanQRController =
    Get.put(ScanQRController(), permanent: true);
