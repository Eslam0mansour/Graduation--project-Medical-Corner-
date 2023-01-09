import 'package:dio/dio.dart';

//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=175d092819df4b5883da782634fcd12f
//c806ed6527df4f2aadc50d564e6923d4
//175d092819df4b5883da782634fcd12f
class DioHelper{
  static late Dio dio;
  static inti(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: false,
      )
    );
  }
  // ignore: non_constant_identifier_names
  static Future<Response> getData({ required String url, required Map<String, dynamic> q_p })async{
    return await dio.get(url,queryParameters: q_p,);
  }
}