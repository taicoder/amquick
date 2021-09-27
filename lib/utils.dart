import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'all_export.dart';
import 'package:intl/intl.dart';


var pixelRatio = window.devicePixelRatio;

//Size in physical pixels
var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
var padding = window.padding;

//Safe area paddings in logical pixels
var paddingLeft = window.padding.left / window.devicePixelRatio;
var paddingRight = window.padding.right / window.devicePixelRatio;
var paddingTop = window.padding.top / window.devicePixelRatio;
var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
var safeWidth = logicalWidth - paddingLeft - paddingRight;
var safeHeight = logicalHeight - paddingTop - paddingBottom;

enum FormatType { DATE, TIME, DATE_TIME }

String getDisplayDateTime(dynamic dateTime,
    {FormatType type = FormatType.DATE_TIME}) {
  if (dateTime == null) return 'Chưa có thông tin';

  DateTime dt = (dateTime is DateTime) ? dateTime : DateTime.parse(dateTime);

  if (dateTime == '' || dateTime == null) return '';
  switch (type) {
    case FormatType.DATE:
      return DateFormat('dd/MM/yyyy').format(dt);
    case FormatType.TIME:
      return DateFormat.Hm().format(dt);
    case FormatType.DATE_TIME:
      return DateFormat('HH:mm dd/MM/yyyy').format(dt);
    default:
      return DateFormat('HH:mm dd/MM/yyyy').format(dt);
  }
}

Widget loadingData({
  String svgAsset = 'ic_loading',
  double size = 100,
}) {
  return Center(
    child: Container(
      width: size,
      height: size,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: size,
                width: size,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  backgroundColor: ThemeConfig.primaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/svg/$svgAsset.svg', width: 50),
            ),
          ),
        ],
      ),
    ),
  );
}

bool isMobile() {
  return Get.width < 600;
}

double getSize(double? size) {
  if (size == null) return 0;
  if (Get.context == null) return size;
  var shortestSide = Get.width > 900 ? 900 : Get.width;
  if (shortestSide < 600)
    return size;
  else
    return size * (shortestSide / 600);
}

double get getPercent {
  var shortestSide = Get.width > 900 ? 900 : Get.width;
  if (shortestSide < 600)
    return 1;
  else
    return (shortestSide / 600);
}

void preCacheAssetImage(List<String> assets, BuildContext context) {
  Future.wait(assets
      .map((e) => precacheImage(AssetImage('assets/img/$e'), context))
      .toList());
}

DateTime? convertToDate(String date) {
  try {
    var items = date.split('/');
    if (items.length != 3) items = date.split('-');
    return DateTime(
        int.parse(items[2]), int.parse(items[1]), int.parse(items[0]));
  } catch (e) {
    return null;
  }
}

String convertStringDateFromDateTime(DateTime? date) {
  try {
    return DateFormat("dd/MM/yyyy").format(date!);
  } catch (e) {
    return "";
  }
}

String convertVND(double x){
  try {
    final formatter =  NumberFormat.decimalPattern("vi_VN").format(x);
    return formatter;
  }catch(e){
    return e.toString();
  }
}

num convertToNum(String x){
  try {
    final formatter =  NumberFormat.decimalPattern("vi_VN").parse(x);
    return formatter;
  }catch(e){
    return 0;
  }
}

String convertStringDateFromTimestamp(int timestamp) {
  try {
    var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return  DateFormat('dd/MM/yyyy').format(dt);
  }catch(e){
    return e.toString();
  }
}

String convertStringDateTimeFromTimestamp(int timestamp) {
  try {
    var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return  DateFormat('dd/MM/yyyy, HH:mm:ss').format(dt);
  }catch(e){
    return e.toString();
  }
}

void myModalBottomSheetPhongBan(BuildContext context, TextEditingController textEditingController){
  showModalBottomSheet(
      isScrollControlled:true,
      backgroundColor: ThemeConfig.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      builder: (context){
        return FractionallySizedBox(
          heightFactor: 0.95,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Chọn Phòng ban", style: TextStyle(fontSize: ThemeConfig.titleSize),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 250,
                          child:  TextFormField(
                            onChanged:  (value){
                              assetController.searchPhongBan();
                            },
                            // keyboardType: TextInputType.number,
                            controller: assetController.searchPhongBanController,
                            decoration: InputDecoration(
                              hintText: "Tìm kiếm",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              isDense: true, // important line
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20, 10, 20, 10), // control your hints text size
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ) ,
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.close)),


                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(()=>!assetController.processing? ListView(
                    children: ListTile.divideTiles( //          <-- ListTile.divideTiles
                      context: context,
                      tiles: assetController.listSearchPhongBan.map((pb) => ListTile(
                        onTap: (){
                          textEditingController.text=pb.tenpb;
                          Navigator.pop(context);
                        },
                        title: Text(pb.tenpb, style: TextStyle(fontSize: ThemeConfig.titleSize)),
                      )),
                    ).toList(),
                  ) : CircularProgressIndicator()) ,
                ),

              ],
            ) ,
          ),
        );

      });
}


Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

Uint8List dataFromBase64String(String base64String) {
  try{
    if(base64String.isEmpty)  base64String ="-1";
    return base64Decode(base64String);
  }catch(e){
    return base64Decode("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");
  }
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

int getRamdom(int range){
  Random random = new Random();
  return random.nextInt(range);
}


double get marginHorizon => getSize(8);
double get marginVertical => getSize(12);
Widget get space => SizedBox(height: getSize(4), width: getSize(4),);
