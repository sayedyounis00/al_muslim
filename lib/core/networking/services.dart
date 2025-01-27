import 'dart:developer';
import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();

  void setBaseUrl({required String baseUrl}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  getData({required String endPoint}) async {
    try {
      Response response = await dio.get(
        endPoint,
      );
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }
}
