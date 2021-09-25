import 'package:amquick/all_export.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin UserApi on BaseApi {

  Future<bool> login({String? user, String? password}) async {
    final url = '/user/login';
    final data = {
      "user": user,
      "password": password,
    };
    try {
      var response = await dio.post(url, data: data);
      if (response.data["success"] == "OK") {
        globalController.userSharedPreferences(UserModel.fromJson(response.data["results"]),response.data["token"].toString());
        return true;
      } else {
        globalController.error = response.data["results"];
        return false;
      }
    } catch (e) {
      globalController.error = e.toString();
      return false;
    }
  }

  Future<bool> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      const url = '/user/getUser';
      final data = {
        "tendangnhap": globalController.tendangnhap
      };
      var response = await dio.post(url, data: data,  options: Options(headers: {"auth-token": token}));
      if (response.data["success"] == "OK") {
        userController.userModel = UserModel.fromJson(response.data["results"]);
        return true;
      } else {
        globalController.error = response.data["results"];
        return false;
      }
    } catch (e) {
      print(e.toString());
      globalController.error = e.toString();
      return false;
    }
  }

  Future<bool> updateuser(UserModel userModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      const url = '/user/updateuser';
      final data = {
        "user": userModel.toJson()
      };
      var response = await dio.post(url, data: data,  options: Options(headers: {"auth-token": token}));
      if (response.data["success"] == "OK") {

        return true;
      } else {
        globalController.error = response.data["results"];
        return false;
      }
    } catch (e) {
      globalController.error = e.toString();
      return false;
    }
  }




}
