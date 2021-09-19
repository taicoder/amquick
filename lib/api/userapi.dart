import 'package:amquick/all_export.dart';

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
}
