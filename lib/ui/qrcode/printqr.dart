import 'package:amquick/all_export.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';


class PrintQRCode extends StatefulWidget {
  const PrintQRCode({Key? key}) : super(key: key);

  @override
  _PrintQRCodeState createState() => _PrintQRCodeState();
}

class _PrintQRCodeState extends State<PrintQRCode> {

 // BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  bool _connected = false;
  late BluetoothDevice _device;
  String tips = 'Không có thiết bị được kết nối';

  @override
  void initState() {
    super.initState();
    if (_connected) tips = 'Đã kết nối'; // Khi vào trang sẽ check xem đã kết nối trước đó hay chưa

   // WidgetsBinding.instance?.addPostFrameCallback((_) => initBluetooth());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
