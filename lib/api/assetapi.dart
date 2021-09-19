import 'package:amquick/all_export.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin AssetApi on BaseApi {
  Future<bool> categrories() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();
    const url = '/asset/categrories';
    try {
      var response = await dio.post(url, data: {},  options: Options(headers: {"auth-token": token}));
      assetController.listCategories=[];
      if (response.data["success"] == "OK") {
        assetController.listCategories.addAll((response.data["results"] as List).map((e) => LoaiTSModel.fromJson(e)).toList());
      }
      return true;
    } catch (e) {
      globalController.error = e.toString();
      return false;
    }
  }

  Future<bool> asset() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();
    const url = '/asset/taisan';
    try {
      var response = await dio.post(url, data: {},  options: Options(headers: {"auth-token": token}));
      assetController.listAssets=[];
      if (response.data["success"] == "OK") {
        assetController.listAssets.addAll((response.data["results"] as List).map((e) => TaiSanModel.fromJson(e)).toList());
      }
      return true;
    } catch (e) {
      print(e.toString());
      globalController.error = e.toString();
      return false;
    }
  }
}
