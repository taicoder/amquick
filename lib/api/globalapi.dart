import 'package:amquick/all_export.dart';
import 'package:dio/dio.dart';

class BaseApi {
  Dio dio = Dio(
  BaseOptions(
    baseUrl: AppConfig.SERVER_URL,
    connectTimeout: 5*1000,  //10s
    receiveTimeout: 60*1000,  //60s
  ));

  // void badCertificateCallback() {
  //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (HttpClient client) {
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //     return client;
  //   };
  // }

  // void saveLog(String label, e) {
  //   print('[$label] $e');
  //   //  print(e.response?.statusCode.toString());
  //   if (e.response?.statusCode == 500 || e.response?.statusCode == 502) {
  //     appController.errorLog = 'Lỗi hệ thống vui lòng thử lại sau';
  //   } else {
  //     if (e.response?.data != null)
  //       appController.errorLog =
  //           e.response?.data['message'] ?? e.response?.data['error'] ?? '';
  //   }
  // }
}

class Api extends BaseApi with UserApi, AssetApi {}

final Api api = Api();
