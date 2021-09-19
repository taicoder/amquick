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

String convertDateToString(DateTime? date) {
  try {
    return DateFormat("dd-MM-yyyy").format(date!);
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

double get marginHorizon => getSize(8);
double get marginVertical => getSize(12);
Widget get space => SizedBox(height: getSize(4), width: getSize(4),);
