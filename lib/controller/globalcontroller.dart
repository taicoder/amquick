import 'package:amquick/all_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  String error="";

  RxInt _year= 0.obs;
  int get year => _year.value;

  String tendangnhap="";
  String matkhau="";
  String hoten="";
  String token="";
  String tenphongban="";

  setYearSharedPrefsAdd() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _year.value = sharedPreferences.getInt("year")!;
    _year.value++;
    sharedPreferences.setInt("year",_year.value);
  }

  setYearSharedPrefsSub() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _year.value = sharedPreferences.getInt("year")!;
    _year.value--;
    sharedPreferences.setInt("year",_year.value);
  }

  getSharedPrefs() async{
    final prefs = await SharedPreferences.getInstance();
    _year.value = prefs.getInt("year")!;
    tendangnhap=prefs.getString("tendangnhap")!;
    hoten=prefs.getString("hoten")!;
    token=prefs.getString("token")!;
    tenphongban=prefs.getString("tenphongban")!;

  }

  void userSharedPreferences(UserModel user, String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.setString('tendangnhap', user.tendangnhap);
    prefs.setString('hoten', user.hoten);
    prefs.setString('token', token);
    prefs.setInt('year', DateTime.now().year);
    prefs.setString('tenphongban', user.phongban!.tenpb);

    getSharedPrefs();
  }

  void userSharedPreferencesNoToken(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tendangnhap', user.tendangnhap);
    prefs.setString('hoten', user.hoten);
    prefs.setString('tenphongban', user.phongban!.tenpb);

    getSharedPrefs();
  }

  // use String value = await getValue() ?? "";
  Future<String> getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(key).toString();
    return stringValue;
  }

  Future<int> getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int stringValue = prefs.getInt(key)!;
    return stringValue;
  }

  void successToast(String content) {
     Get.snackbar(
       content,
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ThemeConfig.blueColor.withOpacity(0.8),
      colorText: Colors.white,
       borderRadius: 5,
    );
  }

  void errorToast(String content) {
    Get.snackbar(
      "Lỗi",
      content,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ThemeConfig.redColor.withOpacity(0.5),
      borderRadius: 0,
    );
  }


  @override
  void onInit() {
    getSharedPrefs();
    super.onInit();
  }
}

final GlobalController globalController =  Get.put(GlobalController(), permanent: true);
