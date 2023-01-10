import 'package:dio/dio.dart';

//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=175d092819df4b5883da782634fcd12f
//c806ed6527df4f2aadc50d564e6923d4
//175d092819df4b5883da782634fcd12f
class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}