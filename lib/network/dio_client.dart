import 'package:dio/dio.dart';
import 'package:exercisemates/constant/text.dart';

class DioClient {
  static getDio() {
    final dio = Dio();
    dio.options.headers["Content-Type"] = "application/json;charset=UTF-8";
    dio.options.headers["X-RapidAPI-Key"] = AppText.apiKey;
    dio.options.headers["X-RapidAPI-Host"] = AppText.apiHost;
    dio.options.connectTimeout = const Duration(seconds: 1000); //10s
    dio.options.receiveTimeout = const Duration(seconds: 1000); //10s
    return dio;
  }

  static getDioFormData() {
    final dio = Dio();
    dio.options.contentType = Headers.acceptHeader;
    return dio;
  }
}
