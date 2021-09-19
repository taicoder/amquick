import 'package:amquick/all_export.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

class ScanQRController extends GetxController {
  RxBool _processing = false.obs;
  bool get processing => _processing.value;
  RxString _qrCode = "".obs;
  String get qrCode => _qrCode.value;
  String scanedQrCode="";
  @override
  void onInit() {
    super.onInit();
  }
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Hủy', true, ScanMode.QR);
      _qrCode.value=barcodeScanRes;
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

}

final ScanQRController scanQRController =
    Get.put(ScanQRController(), permanent: true);
