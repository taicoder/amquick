import 'package:amquick/all_export.dart';
import 'package:flutter/services.dart';
class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: ()  {
                  //  Get.snackbar("title", "message");
                      scanQRController.scanQR(context);
                  },
                  child: Text("Scan QR")),
              SizedBox(height:30),
              Obx(() =>Text(scanQRController.scanedQrCode)) ,
            ],
          ),
        ),
      ),
    );
  }
}
