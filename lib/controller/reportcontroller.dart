import 'package:amquick/all_export.dart';
import 'package:intl/intl.dart';

class ReportController extends GetxController {
  RxBool _processing = false.obs;
  bool get processing => _processing.value;
 // PDFDocument document= PDFDocument();
  Future<void> loadDocument() async {
    _processing.value=false;
    _processing.value=true;
   // document=await PDFDocument.fromURL("http://conorlastowka.com/book/CitationNeededBook-Sample.pdf");
  }

}

final ReportController reportController =
Get.put(ReportController(), permanent: true);
