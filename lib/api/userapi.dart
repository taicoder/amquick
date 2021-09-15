import 'dart:convert';

import 'package:amquick/all_export.dart';
import 'package:dio/dio.dart';

mixin UserApi on BaseApi {
  Future<bool> login({String? user, String? password}) async {
    final url = '/user/login';
    final data = {
      "user": user,
      "password": password,
    };
    try {
      var response = await dio.post(url, data: data);
     //  print(response.data["results"]);
     // UserModel a= UserModel.fromJson(response.data["results"]);
     //  if(a.phongban==null) print("1");
     //  else print("0");
    }catch(e){
      globalController.error=e.toString();
      return false;
    }
    return true;
  }
}
